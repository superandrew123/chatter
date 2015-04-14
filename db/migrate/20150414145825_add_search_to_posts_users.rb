class AddSearchToPostsUsers < ActiveRecord::Migration
  def change
    add_column :users, :search_handle, :string
    add_column :posts, :search_post_content, :string
  end
end
