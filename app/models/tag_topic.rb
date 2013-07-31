class TagTopic < ActiveRecord::Base
  attr_accessible :topic

  has_many :taggings,
  :class_name => "Tagging",
  :foreign_key => :tag_topic_id,
  :primary_key => :id

end
