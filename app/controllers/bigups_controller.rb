class BigupsController < ApplicationController
  def create
    spool = Spool.find(params[:spool_id])
    @bigup = spool.bigups.build(params[:bigup])
    if @bigup.save
      flash[:success] = "thread bumped!"
      redirect_to root_path
    else
      flash[:error] = "there must be something wrong with this rails app&hearts;,, ;"
      redirect_to root_path
    end
  end

  def show
    @bigup = Bigup.find(params[:id])

    if !(@bigup.title.blank?)
      @title = CGI.escapeHTML(@bigup.title)
    elsif !(@bigup.content.blank?)
      @title = CGI.escapeHTML(@bigup.content)
    elsif !(@bigup.name.blank?)
      @title = "comment #{@bigup.id} by #{CGI.escapeHTML(@bigup.name)}"
    else
      @title = "untitled"
    end

    @spool = Spool.find(@bigup.spool_id)
  end

end
