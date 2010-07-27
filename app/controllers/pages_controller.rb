class PagesController < ApplicationController
  def home
    @bigups = Bigup.all
  end

end
