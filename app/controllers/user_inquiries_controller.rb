class UserInquiriesController < ApplicationController

def new
	@inquiries = Inquiries.new
	@user = current_user
end

def create
	@inquiries = Inquiries.new(inquiries_params)
	@inquiries.save
	redirect_to user_inquiries_complete
end

def complete
end

end

