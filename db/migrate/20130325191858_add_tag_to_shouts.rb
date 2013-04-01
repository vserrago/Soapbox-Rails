class AddTagToShouts < ActiveRecord::Migration
  def change
    add_column :shouts, :tag, :string
  end
end
