class CardsController < ApplicationController

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)
  end

  private

  def card_params
    params.require(:card).permit(:text, :audio)
  end

end
