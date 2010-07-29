class BigupsController < ApplicationController
  def index
    @bigups = Bigup.all
    @new_bigup = Bigup.new
  end

  #def new
  #  @bigup = Bigup.new
  #end

  def create
    @bigup = Bigup.new(params[:bigup])
    if @bigup.save
      flash[:success] = "thread posted"
      redirect_to root_path
    else
      @bigups = []
      flash[:error] = "uh oh"
      redirect_to root_path
    end
  end

end
