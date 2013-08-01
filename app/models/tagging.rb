class Tagging < ActiveRecord::Base
  attr_accessible :tag_topic_id, :short_url_id

  belongs_to :short_url,
  :class_name => "ShortUrl",
  :foreign_key => :short_url_id,
  :primary_key => :id

  belongs_to :tag_topic,
  :class_name => "TagTopic",
  :foreign_key => :tag_topic_id,
  :primary_key => :id

  def self.find_by_tag_topic(tt)
    self.where("tag_topic = ?", tt)
  end

end
