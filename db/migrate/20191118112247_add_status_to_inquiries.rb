class AddStatusToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :status, :text
  end
end
