class Api::V1::HottestLinksController < ApplicationController
  def index
    render json: Link.hottest
  end
end
