class IndexController < ApplicationController
  def index
    @players = Player.all
  end
end
