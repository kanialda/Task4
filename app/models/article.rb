class Article < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 10 }
  
  has_attached_file :image,
  :url => "/upload_images/:basename.:extension",
  :default_url => "/assets/Missing.png"
  
  validates :image, presence: true,
  attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
  attachment_size: { less_than: 200.kilobytes }

end
