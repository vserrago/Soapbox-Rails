class Rating < ActiveRecord::Base
  attr_accessible :shout_id, :user_id, :vote
end
