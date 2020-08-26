class BuysController < ApplicationController
  def done
    @buys = Buy.all
  end
end
