class CreateValidationCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :validation_codes do |t|
      t.string :code
      t.string :type
      t.string :email
      t.datetime :used_at

      t.timestamps
    end
  end
end
