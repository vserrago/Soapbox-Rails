class AddRatingToShout < ActiveRecord::Migration
  def change
    add_column :shouts, :rating, :integer
  end
end
