class Topic < ApplicationRecord

  belongs_to :language

  def self.search(term)
    where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end

end
