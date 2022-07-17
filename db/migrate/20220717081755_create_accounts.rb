class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :amount
      t.text :remark
      t.string :type
      t.references :tags, null: false, foreign_key: true

      t.timestamps
    end
  end
end
