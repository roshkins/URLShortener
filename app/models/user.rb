class User < ActiveRecord::Base
  attr_accessible :username, :email

  has_many( :short_urls
  :class_name => "ShortUrl",
  :foreign_key => :user_id,
  :primary_key => :id
  )

end
