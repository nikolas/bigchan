class BigupsController < ApplicationController
  def create
    spool = Spool.find(params[:spool_id])
    @bigup = spool.bigups.build(params[:bigup])
    if @bigup.save
      flash[:success] = "reply posted"
      redirect_to root_path
    else
      flash[:error] = "there must be something wrong with this rails app&hearts;,, ;"
      redirect_to root_path
    end
  end

end
