class RentalsController < ApplicationController

  def index
  end


  def show
  end


  def new
    @rental = Rental.new
  end


  def create
    start_date    = params[:rental][:start_date]
    end_date      = params[:rental][:end_date]
    game          = Game.find(params[:rental][:game_id])
    user          = User.find(params[:rental][:user_id])
    Rental.create(start_date: start_date, end_date: end_date, game: game, user: user)
    redirect_to profiler_path(user)
  end


  def edit
  end


  def update
    @rental = Rental.find(params[:id])
    @rental.status = params[:id]
    @rental.save!
    redirect_to profiler_path(current_user.id)
  end


  def delete
  end

  private



end
