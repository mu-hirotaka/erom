class IndexController < ApplicationController
  def index
    @articles = Article.find(:all, :order => 'created_at DESC')
#    @articles = Article.where(:round_id => @round.id).order('point desc')
#    points = @players.map { |player| player.point }
#    @all_points = points.inject(:+)
#    @max_point = points.max
#    @min_point = points.min
  end
end
