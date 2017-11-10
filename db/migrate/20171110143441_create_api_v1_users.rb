class CreateApiV1Users < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :high_score

      t.timestamps
    end
  end
end
