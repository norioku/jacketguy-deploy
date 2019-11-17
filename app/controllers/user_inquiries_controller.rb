class UserInquiriesController < ApplicationController

def new
	@inquiries = Inquiry.new
	@user = current_user
end

def create
	@inquiries = Inquiry.new(inquiries_params)
	@inquiries.save
	redirect_to user_inquiries_complete
end

def complete
end

end

