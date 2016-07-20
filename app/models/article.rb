class Article < ActiveRecord::Base
  
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :image, 
  attachment_content_type: { content_type: /\Aimage\/.*\Z/ , default_url: 'public/upload_images'},
  attachment_size: { less_than: 200.kilobytes }


  has_attached_file :image, styles: { large: '500x500>', square: '200x200#', medium: '300x300>', thumb: '100x100>' }
  
end
