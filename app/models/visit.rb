class Visit < ActiveRecord::Base
   attr_accessible :short_url_id, :user_id

   belongs_to :user,
   :class_name => "User",
   :foreign_key => :user_id,
   :primary_key => :id

   belongs_to :url,
   :class_name => "ShortUrl",
   :foreign_key => :short_url_id,
   :primary_key => :id

end
