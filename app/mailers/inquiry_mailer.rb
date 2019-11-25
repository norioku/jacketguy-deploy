class InquiryMailer < ApplicationMailer

def send_mail(inquiry)
	@inquiry = inquiry;
    mail(
    subject: "【ジャケガイ!!】お問い合わせ回答",
    to: inquiry.email,
    from: "fuzisi.okano184@gmail.com"
    )
end
end

