class CardSession < ApplicationRecord

  CARDS_COUNT = 20

  has_and_belongs_to_many :cards

end
