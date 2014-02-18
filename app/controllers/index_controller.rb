class IndexController < ApplicationController
  def index
    @round = Round.last
    @players = Player.where(:round_id => @round.id).order('point desc')
  end
end
