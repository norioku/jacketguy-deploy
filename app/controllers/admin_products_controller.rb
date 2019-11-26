class AdminProductsController < ApplicationController

	before_action :authenticate_admin!, only:[:index, :show, :new, :create, :edit, :update, :destroy]

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@reviews = Review.where(product_id: @product)
		@arrival_stocks = @product.arrival_records.all.sum(:arrival_product)
		@history_stocks = @product.product_histories.all.sum(:order_quantity)
		@stocks = @arrival_stocks - @history_stocks
		@new_products = Product.page(params[:page])
	end

	def new
		@admin_product = Product.new
		@artist = Artist.new
		@label = Label.new
		@genre = Genre.new
		@disc = @admin_product.discs.build
		@disc.songs.build

	end


	def create
		@artist = Artist.new(artist_params)
		unless Artist.find_by(name:@artist.name)
			@artist.save
		end
		@label = Label.new(label_params)
		unless Label.find_by(name:@label.name)
			@label.save
		end
		@genre = Genre.new(genre_params)
		unless Genre.find_by(name:@genre.name)
			@genre.save
		end

		@admin_product = Product.new(product_params)
		@admin_product.artist_id = Artist.find_by(name:@artist.name).id
		@admin_product.label_id = Label.find_by(name:@label.name).id
		@admin_product.genre_id =  Genre.find_by(name:@genre.name).id


		  if @admin_product.save
		    redirect_to admins_arrival_records_new_path(@admin_product.id)
		  else
		    flash.now[:danger] = "商品登録に失敗しました"
		    render :new
		  end
	end

	def edit
		@admin_product = Product.find(params[:id])
		@artist = @admin_product.artist
	    @label = @admin_product.label
	    @genre = @admin_product.genre
	end

	def update
		admin_product = Product.find(params[:id])
		artist = admin_product.artist
	    label = admin_product.label
	    genre = admin_product.genre

	    artist.update(artist_params)
	    label.update(label_params)
	    genre.update(genre_params)
		admin_product.update(product_params)

		redirect_to admins_product_path(admin_product.id)
	end

	def destroy
		@admin_product = Product.find(params[:id])
		@artist = @admin_product.artist
	    @label = @admin_product.label
	    @genre = @admin_product.genre
		 if admin_product.destroy
		    flash[:success] = "商品を削除しました"
		    redirect_to admins_products_path
		 else
		    flash[:danger] = "商品削除に失敗しました"
		    render :edit
		 end
	end

	private
		def product_params
			params.require(:product).permit(:title,:price,:release_date,:product_image, :sale_status,
			  discs_attributes: [:id, :disc_num, :_destroy, :created_at, :updated_at,
			  songs_attributes: [:id, :song_num, :name, :_destroy, :created_at, :updated_at]])
		end

		def artist_params
			params.require(:artist).permit(:name)
		end

		def label_params
			params.require(:label).permit(:name)
		end

		def genre_params
			params.require(:genre).permit(:name)
		end


end
