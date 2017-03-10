class Content < ApplicationRecord

  has_attached_file :audio
  #validates_attachment_content_type :audio, content_type: /\Aaudio\/.*\z/
  do_not_validate_attachment_file_type :audio

end
