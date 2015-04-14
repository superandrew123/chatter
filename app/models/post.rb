class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates_presence_of :post_content, :user_id

  before_create :set_expired, :set_search

  def set_expired
    self.expired = Time.now + 604800 if self.expired == nil
  end

  def set_search
    self.search_post_content = self.post_content.downcase
  end
end
