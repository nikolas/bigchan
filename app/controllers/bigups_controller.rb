class BigupsController < ApplicationController
  def index
    @bigups = Bigup.all
  end

  def create
    @bigup = Bigup.new(params[:bigup])
    if @bigup.save
      flash[:success] = "congrats"
      redirect_to root_path
    else
      @bigups = []
      flash[:error] = "uh oh"
      redirect_to root_path
    end
  end

end
