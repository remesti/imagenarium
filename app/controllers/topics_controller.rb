class TopicsController < ApplicationController

  def index
    @topics = Topic.where(language_id: current_user.cards_language_id) if current_user
    @topics ||= Topic.where(language_id: params[:language_id])
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      params[:topic][:images].each do |image|
        CardCreator.new(@topic, image).perform
      end

      redirect_to @topic
    else
      render :new
    end
  end

  def topic_params
    params.require(:topic).permit(:name, :language_id)
  end

end
