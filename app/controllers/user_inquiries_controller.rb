class UserInquiriesController < ApplicationController

def new
	@inquiry = Inquiry.new
	@user = current_end_user
end

def create
	@inquiry = Inquiry.new(inquiry_params)
	@inquiry.save
	redirect_to user_inquiries_complete
end

def complete
end

end


