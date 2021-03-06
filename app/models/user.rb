class User < ActiveRecord::Base
  attr_accessible :username, :email

  has_many :short_urls,
  :class_name => "ShortUrl",
  :foreign_key => :user_id,
  :primary_key => :id


  has_many :comments,
  :class_name => "Comment",
  :foreign_key => :user_id,
  :primary_key => :id

  has_many :visits,
  :class_name => "Visit",
  :foreign_key => :user_id,
  :primary_key => :id

  def self.find_by_email(email)
    self.where("email = ?", email)[0]
  end


end
