class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :shout

      t.timestamps
    end
    add_index :tags, :shout_id
  end
end
