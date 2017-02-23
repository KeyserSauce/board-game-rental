class ProfilersController < ApplicationController
  def show
    array_of_outrented = []
    current_user.games.each do |game|
      array_of_outrented << game if !game.rentals.empty?
    end
    @outrented_games = array_of_outrented
    @pending_rentals = current_user.rentals.where(status: "pending")
    @current_rentals = current_user.rentals.where(status: "active")
    @user_games = current_user.games
  end
end
