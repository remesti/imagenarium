class Card < ApplicationRecord

  belongs_to :content
  belongs_to :image
  belongs_to :language
  belongs_to :topic
  has_and_belongs_to_many :schichida_sessions

  accepts_nested_attributes_for :content, reject_if: proc { |attrs| attrs[:audio].blank? }
  accepts_nested_attributes_for :image, reject_if: proc { |attrs| attrs[:image].blank? }

  validates :content, :image, :language, :topic, presence: true

  def topic_name
    topic.try(:name)
  end

  def topic_name=(name)
    self.topic = Topic.find_or_create_by(name: name, language: language) if name.present?
  end

end
