class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :shout_id
      t.integer :user_id
      t.integer :vote

      t.timestamps
    end
  end
end
