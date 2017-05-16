class SchichidaSessionsController < ApplicationController
  def new
    @schichida_session = SchichidaSession.new
  end

  def create
    @schichida_session = SchichidaSession.new(user: current_user)
    if params[:topic_id]
      topic = Topic.find(params[:topic_id])
      @schichida_session.cards = topic.try(:cards)
    else
      @schichida_session.build_cards
    end

    if @schichida_session.cards.empty?
      redirect_to topics_url
    elsif @schichida_session.save
      redirect_to @schichida_session
    else
      render :new
    end
  end

  def show
    schichida_session = SchichidaSession.find params[:id]

    @cards = schichida_session.cards.to_a
    @first_card = @cards.shift
  end
end
