class InquiryMailer2 < ApplicationMailer

  def send2_mail(inquiry)
    @inquiry = inquiry;
    mail(
      subject: "お問い合わせを受け付けました。", #メールのタイトル
      to: inquiry.email,
      from: "fuzisi.okano184@gmail.com"
    ) do |format|
      format.text
    end
  end
end