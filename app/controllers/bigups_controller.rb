class BigupsController < ApplicationController
  #def index
  #  @bigups = Bigups.paginate(:page => params[:page])
  #end

  def create
    @bigup = Bigup.new(params[:bigup])
    if @bigup.save
      flash[:success] = "congrats"
      redirect_to root_path
    else
      flash[:error] = "uh oh"
      render 'pages/home'
    end
  end

end
