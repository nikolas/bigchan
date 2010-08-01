class SpoolsController < ApplicationController
  def index
    @spools = Spool.paginate(:page => params[:page])
    @new_spool = Spool.new
    @new_spool.bigups.build
  end

  def show
    @spool = Spool.find(params[:id])
    if @spool.bigups.first.title
      @title = CGI.escapeHTML(@spool.bigups.first.title)
    end
    @bigups = @spool.bigups.all
    @bigup = @spool.bigups.build
  end

  def create
    @spool = Spool.new(params[:spool])
    if @spool.save
      flash[:success] = "thread posted"
      redirect_to root_path
    else
      flash[:error] = "there was something wrong with your image"
      redirect_to root_path
    end
  end

end
