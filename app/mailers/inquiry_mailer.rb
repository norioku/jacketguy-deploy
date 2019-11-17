class InquiryMailer < ApplicationMailer

def send_mail(inquiry)
    mail to: user.email
    subject: "ActionMailer test"

end