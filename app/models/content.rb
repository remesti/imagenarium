class Content < ApplicationRecord
  ALLOWED_AUDIO = [
    'audio/mpeg',
    'audio/x-mpeg',
    'audio/mp3',
    'audio/x-mp3',
    'audio/mpeg3',
    'audio/x-mpeg3',
    'audio/mpg',
    'audio/x-mpg',
    'audio/x-mpegaudio',
    'application/octet-stream'
  ]

  has_attached_file :audio,
                    storage: :cloudinary,
                    cloudinary_resource_type: :video,
                    path: ":class/:attachment/:id_partition/:style/:filename"

  validates_attachment_content_type :audio, content_type: ALLOWED_AUDIO
  validates :audio, presence: true
  validates :text, presence: true, uniqueness: true

end
