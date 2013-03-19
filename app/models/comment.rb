class Comment < ActiveRecord::Base
  belongs_to :shout
  attr_accessible :body, :commenter
end
