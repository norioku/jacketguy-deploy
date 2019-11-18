class UserInquiriesController < ApplicationController

def new

	@inquiries = Inquiry.new
	@user = current_user
end


def create
	@inquiry = Inquiry.new(inquiries_params)
  @user = EndUser.find(params[:id])
	@inquiry.save
	redirect_to user_inquiries_complete_path(@user)
end

def complete
  @user = EndUser.find(params[:id])
end

def inquiries_params
  params.require(:inquiry).permit(:end_user_name, :subject, :content, :reply)
end

end


