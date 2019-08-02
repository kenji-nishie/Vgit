class AddCheckFromMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :check_num, :boolean, default: true, null: false
  end
end
