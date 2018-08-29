class AddPhoneToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_num, :string
  end
end