class Content < ApplicationRecord

  has_attached_file :audio,
                    storage: :cloudinary,
                    cloudinary_resource_type: :video,
                    path: ":class/:attachment/:id_partition/:style/:filename"

  validates_attachment_content_type :audio, content_type: 'application/octet-stream'
  validates :audio, presence: true
  validates :text, presence: true

end
