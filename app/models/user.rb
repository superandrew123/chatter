class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates_uniqueness_of :handle, :email
  validates_presence_of :handle, :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


end
