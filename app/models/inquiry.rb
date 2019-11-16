class Inquiry < ApplicationRecord
	validates :end_user_name, presence: true
    validates :subject, presence: true
    validates :content, presence: true
    validates :reply, presence: true
end

