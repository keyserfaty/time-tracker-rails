class RemoveEmptyTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :add_type_to_users
    drop_table :remove_tables
  end
end
