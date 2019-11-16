class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :email,              null: false, default: ""
      t.string :end_user_name
      t.string :subject
      t.text   :content
      t.text   :reply
      t.timestamps  null: false
    end
  end
end


