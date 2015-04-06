class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :post_content, :user_id

end
