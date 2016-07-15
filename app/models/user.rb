class User < ActiveRecord::Base
  has_attached_file :avatar, default_url: "/assets/default_pp.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
