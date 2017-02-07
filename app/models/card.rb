class Card < ApplicationRecord

  belongs_to :content
  belongs_to :image
  has_and_belongs_to_many :card_sessions

end
