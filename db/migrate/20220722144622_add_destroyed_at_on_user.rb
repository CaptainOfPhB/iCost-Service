class AddDestroyedAtOnUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :destroyed_at, :datetime, default: nil
  end
end
