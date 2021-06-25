class PrefecturesController < ApplicationController
  include Scraping

  def index
    @rows = set_scraping
  end
end
