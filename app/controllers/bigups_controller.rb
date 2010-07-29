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
      flash[:error] = "you need to upload an image, dude"
      redirect_to root_path
    end
  end

end
