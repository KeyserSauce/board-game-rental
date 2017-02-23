class ResultsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @game_results = Game.search(params[:search]).order("created_at DESC")
  end
end
