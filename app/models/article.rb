class Article < ActiveRecord::Base
  validates :title, presence: true,
                            length: { minimum: 5 }
  validates :content, presence: true,
                            length: { minimum: 10 }
  
validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 200.kilobytes }

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
end
