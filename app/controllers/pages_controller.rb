class PagesController < ApplicationController
  def home
    @spool_items = Bigup.all
  end

end
