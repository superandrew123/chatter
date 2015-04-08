class ChangeColumnPostExpiredVersion3 < ActiveRecord::Migration
  def change
     change_column :posts, :expired, :datetime, :default => nil
  end
end
