class Inquiry < ApplicationRecord
	 #validates :end_user_name, presence: true
     #validates :subject, presence: true
     validates :content, presence: true
     validates :reply, presence: true, on: :update

    enum status:[:未返信, :返信済]
end

