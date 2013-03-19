class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.string :name
      t.string :title
      t.text :message

      t.timestamps
    end
  end
end
