class UserInquiriesController < ApplicationController

def new

	@inquiry = Inquiry.new
	@user = current_end_user

end


def create
	@inquiry = Inquiry.new(inquiries_params)
	@inquiry.end_user_name = current_end_user.first_name+" "+current_end_user.last_name
	@inquiry.email = current_end_user.email
  @user = EndUser.find(params[:id])
	if @inquiry.save
	redirect_to user_inquiries_complete_path(@user)
else
	flash[:notice] = "お問い合わせ内容をご記入ください。"
	render action: :new
end
end

def complete
  @user = EndUser.find(params[:id])
end

def inquiries_params
  params.require(:inquiry).permit(:end_user_name, :subject, :content, :reply)
end

end




