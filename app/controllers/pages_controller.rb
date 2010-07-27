class PagesController < ApplicationController
  def home
    @bigups = Bigup.paginate(:page => params[:page])
  end

end
