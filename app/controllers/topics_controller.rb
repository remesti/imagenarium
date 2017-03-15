class TopicsController < ApplicationController

  def index
    @topics = Topic.where(language_id: params[:language_id])
  end

  def show
    @topic = Topic.find(params[:id])
  end

end
