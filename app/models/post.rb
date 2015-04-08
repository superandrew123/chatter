class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates_presence_of :post_content, :user_id

  before_create :set_expired

  def set_expired
    self.expired = Time.now + 604800
  end
end
