class AddExperiredToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :expired, :datetime
  end
end
