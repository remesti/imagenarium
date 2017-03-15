class Topic < ApplicationRecord

  belongs_to :language
  has_many :cards

  def self.search(term)
    where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end

end
