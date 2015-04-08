class ChangeColumnPostExpired < ActiveRecord::Migration
  def change
    #make the expired column have a value that is 7 days more the the created value
    change_column :posts, :expired, :datetime, :default => Time.now + 604800
  end
end
