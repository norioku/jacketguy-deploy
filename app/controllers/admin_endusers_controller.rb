class AdminEndusersController < ApplicationController

  before_action :authenticate_admin!, only:[:index, :show, :edit, :update, :destroy]

	def index
		@users = EndUser.all
	end

	def show
		@user = EndUser.find(params[:id])
		@order_histories = OrderHistory.where(end_user_id:@user)
	end

	def edit
    @user = EndUser.find(params[:id])
  end

  def update
    @user = EndUser.find(params[:id])
    @user.update(user_params)
    redirect_to admins_user_path(@user)
  end

  def destroy
    @user = EndUser.find(params[:id])
    @user.destroy
    redirect_to admins_users_path
  end

private

 def user_params
    params.require(:end_user).permit(:email, :last_name, :first_name, :last_kana_name, :first_kana_name, :post_code, :address, :phone_number)

  end
end


# create_table "end_users", force: :cascade do |t|
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "last_name"
#     t.string "first_name"
#     t.string "last_kana_name"
#     t.string "first_kana_name"
#     t.string "post_code"
#     t.string "address"
#     t.string "phone_number"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.datetime "deleted_at"
#     t.index ["deleted_at"], name: "index_end_users_on_deleted_at"
#   end