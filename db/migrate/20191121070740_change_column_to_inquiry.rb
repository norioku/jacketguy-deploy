class ChangeColumnToInquiry < ActiveRecord::Migration[5.2]
  def up
  	change_column :inquiries, :status,:integer, default: 0
  end
end
