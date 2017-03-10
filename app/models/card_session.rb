class CardSession < ApplicationRecord

  CARDS_COUNT = 20

  has_and_belongs_to_many :cards

  def build_cards
    self.cards = Card.limit(CARDS_COUNT)
  end

end
