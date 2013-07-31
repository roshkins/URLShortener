class Comment < ActiveRecord::Base
   attr_accessible :comment, :short_url_id, :user_id

   belongs_to( :user,
   :class_name => "User",
   :foreign_key => :user_id,
   :primary_key => :id
   )

end
