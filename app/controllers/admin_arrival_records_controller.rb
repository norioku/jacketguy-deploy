class AdminArrivalRecordsController < ApplicationController

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
    flash[:notice] = "商品を登録しました"
    redirect_to admin_path
  else
    puts @admin_arrival.errors.full_messages
    flash[:notice] = "商品の登録に失敗しました"
    render :new
  end
end

def admin_arrival_params
  params.require(:arrival_record).permit(:product_id, :arrival_product, :arrival_product_at)
end

end
