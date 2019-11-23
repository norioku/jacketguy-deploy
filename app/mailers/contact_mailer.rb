class ContactMailer < ApplicationMailer

  def send_mail(inquiry)
    @inquiry = inquiry;
    mail(
    subject: "【ジャケガイ!!】お問い合わせを受け付けました。",
    to: inquiry.email,
    from: "fuzisi.okano184@gmail.com"
    )
  end

end