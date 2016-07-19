class Article < ActiveRecord::Base
  has_attached_file :avatar, styles: {large: '500x500>', square: '200x200#', medium: '300x300>', thumb: '100x100>' }
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 10 }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/, default_url: "/images/:style/missing.png",
    attachment_size: { less_than: 200.kilobytes }
end
