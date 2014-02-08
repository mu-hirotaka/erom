class Player < ActiveRecord::Base
  attr_accessible :name, :point, :round_id
end
