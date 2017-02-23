class ProfilersController < ApplicationController
  def show
    @outrented_games = current_user.games.select do |game|
      !game.rentals.empty?
    end

    @pending_owned_rentals = []
    current_user.games.each do |game|
      game.rentals.each do |rental|
        @pending_owned_rentals << rental if rental.status == "pending"
      end
    end

    @current_rentals = current_user.rentals.where(status: "active")
    @user_games = current_user.games
  end
end
