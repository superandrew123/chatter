class AddColumnToUserHandleName < ActiveRecord::Migration
  def change
    add_column :users, :handle, :string
    add_column :users, :name, :string
  end
end
