class LinksController < ApplicationController
  def index
    @links = Link.hottest
  end
end
