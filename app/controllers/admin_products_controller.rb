class AdminProductsController < ApplicationController

def index
end

def show
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
	artist = Artist.new(artist_params)
	unless Artist.find_by(name:artist.name)
		artist.save
    end
	label = Label.new(label_params)
	unless Label.find_by(name:label.name)
		label.save
	end
	genre = Genre.new(genre_params)
	unless Genre.find_by(name:genre.name)
		genre.save
	end



	admin_product = Product.new(product_params)
	admin_product.artist_id = Artist.find_by(name:artist.name).id
	admin_product.label_id = Label.find_by(name:label.name).id
	admin_product.genre_id =  Genre.find_by(name:genre.name).id
	admin_product.save


	redirect_to admins_arrival_records_new_path
end

def edit
end

def update
end

def destroy
end

private
def product_params
	params.require(:product).permit(:title,:price,:release_date,:product_image,disc_attributes: [:id, :disc_num, :_destroy, :created_at, :updated_at, song_attributes: [:id, :song_num, :name, :_destroy, :created_at, :updated_at]])
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
