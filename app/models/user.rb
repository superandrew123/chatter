class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :followers, :class_name => 'Follower', foreign_key: 'followed_id', :dependent => :destroy
  has_many :followings, :class_name => 'Follower', foreign_key: 'follower_id', :dependent => :destroy

  before_create :set_search

  validates_uniqueness_of :handle, :email
  validates_presence_of :handle, :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def set_search
    self.search_handle = self.handle.downcase
  end

end
