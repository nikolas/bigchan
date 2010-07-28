class BigupsController < ApplicationController
  def index
    @bigups = Bigup.all
  end

  def new
    @bigup = Bigup.new
  end

  def create
    @bigup = Bigup.new(params[:bigup])
    if @bigup.save
      flash[:success] = "thread posted"
      redirect_to root_path
    else
      @bigups = []
      flash[:error] = "uh oh"
      render root_path
    end
  end

end
