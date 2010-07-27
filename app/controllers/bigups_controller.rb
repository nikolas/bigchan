class BigupsController < ApplicationController
  def new
    @bigups = Bigup.paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.xml { render :xml => @bigups }
    end
  end

  def create
    @bigup = Bigup.new(params[:bigup])
    if @bigup.save
      flash[:success] = "congrats"
      redirect_to 'index'
    else
      flash[:error] = "uh oh"
      render 'index'
    end
  end

end
