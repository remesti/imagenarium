class Image < ApplicationRecord

  has_attached_file :image,
                    storage: :cloudinary,
                    path: ":class/:attachment/:id_partition/:style/:filename"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
