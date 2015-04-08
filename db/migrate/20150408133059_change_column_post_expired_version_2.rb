class ChangeColumnPostExpiredVersion2 < ActiveRecord::Migration
  def change
    change_column :posts, :expired, :datetime 
  end
end
