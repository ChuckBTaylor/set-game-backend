class AddDefaultToHighScore < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :high_score, :integer
  end
end
