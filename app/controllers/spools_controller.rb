class SpoolsController < ApplicationController
  def index
    @spools = Spool.all.paginate(:page => params[:page], :per_page => 4)
    @new_spool = Spool.new
    @new_spool.bigups.build
  end

  def show
    @spool = Spool.find(params[:id])

    if !(@spool.bigups.first.title.blank?)
      @title = Sanitize.clean(@spool.bigups.first.title)
    elsif !(@spool.bigups.first.content.blank?)
      @title = Sanitize.clean(@spool.bigups.first.content)
    elsif !(@spool.bigups.first.name.blank?)
      @title = "comment #{@spool.bigups.first.id} by #{Sanitize.clean(@spool.bigups.first.name)}"
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
    else
      flash_error
    end
    redirect_to root_path
  end

end
