class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :shout

      t.timestamps
    end
    add_index :comments, :shout_id
  end
end
