class AdminInquiriesController < ApplicationController

	before_action :authenticate_admin!, only:[:index, :show, :create]

	def index
		@inquiries = Inquiry.all
	end

	def show
		@inquiry = Inquiry.find(params[:id])
	end

	def create
		@inquiry = Inquiry.find(params[:id])
		if @inquiry.update(inquiry_params)

			flash[:success] = "安心してください、送信されてますよ。"

		   @inquiry.update(status: "返信済")
			InquiryMailer.send_mail(@inquiry).deliver_now
			redirect_to admins_inquiry_path(@inquiry)
		else
			flash.now[:danger] = "記入漏れていますよ。"
			render :show
		end
		# 　SampleMailer.send_when_create(@user).deliver
	end

	private

	def inquiry_params
		params.require(:inquiry).permit(:email, :end_user_name, :subject, :content, :reply)
	end

end




