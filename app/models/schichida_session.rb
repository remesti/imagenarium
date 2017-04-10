class SchichidaSession < ApplicationRecord

  CARDS_COUNT = 20

  has_and_belongs_to_many :cards

  def build_cards
    self.cards = new_cards.order(:topic_id).limit(CARDS_COUNT)
  end

  private

  def new_cards
    new_cards = Card
      .left_outer_joins(:schichida_sessions)
      .where(schichida_sessions: {id: nil})

    if prev_session
      new_cards.order(opened_topic_first)
    else
      new_cards
    end
  end

  def opened_topic_first
    Card.send(:sanitize_sql_array, ['case when topic_id = %d then 0 else 1 end', opened_topic_id])
  end

  def opened_topic_id
    prev_session.cards.pluck(:topic_id).first
  end

  def prev_session
    SchichidaSession.order('created_at DESC').first
  end

end
