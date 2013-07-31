class ShortUrl < ActiveRecord::Base
  attr_accessible :url, :long_url_id, :user_id

  belongs_to :long_url,
   :class_name => "LongUrl",
   :foreign_key => :long_url_id,
   :primary_key => :id

  has_many :taggings,
   :class_name => "Tagging",
   :primary_key => :id,
   :foreign_key => :short_url_id

  has_many :tag_topics,
   :through => :taggings,
   :source => :tag_topic


end
