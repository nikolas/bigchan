class BigupsController < ApplicationController
  def index
    @bigups = Bigup.all.reverse
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
      flash[:error] = "there was something wrong with your image"
      redirect_to root_path
    end
  end

end
