class CardsController < ApplicationController

  def new
    @card = Card.new
    @card.language = Language.find(params[:language_id]) if params[:language_id]
    @card.topic_name = params[:topic_name] if params[:topic_name]

    @card.build_image
    @card.build_content
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to @card
    else
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to @card
    else
      render :edit
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  private

  def card_params
    params
      .require(:card)
      .permit(
        :content_id,
        :image_id,
        :language_id,
        :topic_name,
        content_attributes: [:text, :audio],
        image_attributes: [:image]
      )
  end

end
