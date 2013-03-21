class Tag < ActiveRecord::Base
  belongs_to :shout
  attr_accessible :name
end
