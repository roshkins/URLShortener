class TagTopic < ActiveRecord::Base
  attr_accessible :topic

  has_many :taggings,
  :class_name => "Tagging",
  :foreign_key => :tag_topic_id,
  :primary_key => :id

  has_many :short_urls, :through => :taggings, :source => :short_url

  def self.find_by_tag_topic(tt_str)
    self.where("topic = ?", tt_str)[0]
  end

end
