class SpoolsController < ApplicationController
  def index
    @spools = Spool.paginate(:page => params[:page])
    @new_spool = Spool.new
    @new_spool.bigups.build
  end

  def show
    @spool = Spool.find(params[:id])

    if !(@spool.bigups.first.title.blank?)
      @title = CGI.escapeHTML(@spool.bigups.first.title)
    elsif !(@spool.bigups.first.content.blank?)
      @title = CGI.escapeHTML(@spool.bigups.first.content)
    elsif !(@spool.bigups.first.name.blank?)
      @title = "comment #{@spool.bigups.first.id} by #{CGI.escapeHTML(@spool.bigups.first.name)}"
    else
      @title = "untitled"
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
