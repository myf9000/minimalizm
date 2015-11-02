class Post < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  acts_as_taggable_on :content, :name, :tag_list
  acts_as_taggable
  is_impressionable
end
