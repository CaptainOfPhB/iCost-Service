class AddVisibleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :visible, :boolean, default: true
  end
end
