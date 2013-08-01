class ShortUrl < ActiveRecord::Base
  attr_accessible :url, :long_url_id, :user_id

  belongs_to :long_url,
   :class_name => "LongUrl",
   :foreign_key => :long_url_id,
   :primary_key => :id

   belongs_to :user,
   :class_name => "User",
   :foreign_key => :user_id,
   :primary_key => :id

  has_many :taggings,
   :class_name => "Tagging",
   :primary_key => :id,
   :foreign_key => :short_url_id

  has_many :tag_topics,
   :through => :taggings,
   :source => :tag_topic

  has_many :visits,
  :class_name => "Visit",
  :primary_key => :id,
  :foreign_key => :short_url_id

  has_many :comments,
  :class_name => "Comment",
  :primary_key => :id,
  :foreign_key => :short_url_id

  def self.shorten(long_url, user)
    short_address = nil
    loop do
      short_address = SecureRandom.urlsafe_base64[0...4]
      break unless self.short_exists?(short_address)
    end

    long = LongUrl.where("url = ?", long_url)[0]
    long = LongUrl.create!(:url => long_url) if long.nil?

    ShortUrl.create!(:url => short_address,
    :long_url_id => long.id,
    :user_id => user.id)

    short_address
  end

  def self.comment_on(short_url, user, comment)
    shorty = self.find_by_short_url(short_url)
    Comment.create!(:comment => comment,
      :short_url_id => shorty.id,
      :user_id => user.id)
  end


  def self.comments(short_url)
    shorty = self.find_by_short_url(short_url)
    shorty.comments
  end

  def self.expand(short_url, user)
    shorty = self.find_by_short_url(short_url)
    Visit.create!(:short_url_id => shorty.id, :user_id => user.id)
    shorty.long_url.url
  end

  def self.find_by_short_url(short_url)
    self.where("url = ?", short_url).first
  end

  def self.tag(short_url, tag)
    shorty = self.find_by_short_url(short_url)
    tag_obj = TagTopic.find_by_tag_topic(tag)
    shorty.tag_topics << tag_obj
  end

  private
  def self.short_exists?(short_url)
    self.where("url = ?", short_url)[0]
  end

end
