class AdminArrivalRecordsController < ApplicationController

  before_action :authenticate_admin!, only:[:index, :new, :create]

  def index
  	@arrival_records = ArrivalRecord.all

  end

  def new
    @product = Product.find(params[:id])
    @admin_arrival = ArrivalRecord.new
  end

  def create
    @product = Product.find(params[:id])
    @admin_arrival = ArrivalRecord.new(admin_arrival_params)


    if @admin_arrival.save
      flash[:success] = "商品を登録しました"
      redirect_to admins_arrival_records_path
    else
      puts @admin_arrival.errors.full_messages
      flash.now[:danger] = "商品の登録に失敗しました"
      render :new
    end
  end

  private

    def admin_arrival_params
      params.require(:arrival_record).permit(:product_id, :arrival_product, :arrival_product_at)
    end

end
