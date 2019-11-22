class InquiryMailer < ApplicationMailer

def send_mail(inquiry)
	@inquiry = inquiry;
    mail(
    subject: "お問い合わせありがとうございます！！！！！！",
    to: inquiry.email,
    from: "fuzisi.okano184@gmail.com"
    )
end
end

