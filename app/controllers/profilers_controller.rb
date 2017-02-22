class ProfilersController < ApplicationController
  def show
    array_of_outrented = []
    current_user.games.each do |game|
      array_of_outrented << game if !game.rentals.empty?
    end
    @outrented = array_of_outrented
  end
end
