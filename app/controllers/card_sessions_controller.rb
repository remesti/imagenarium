class CardSessionsController < ApplicationController
  def new
    @card_session = CardSession.new
  end

  def create
    @card_session = CardSession.new
    @card_session.build_cards
    if @card_session.save
      redirect_to @card_session
    else
      render :new
    end
  end

  def show
    card_session = CardSession.find params[:id]

    @cards = card_session.cards.to_a
    @first_card = @cards.shift
  end
end
