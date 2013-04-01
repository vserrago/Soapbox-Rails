class Shout < ActiveRecord::Base
  attr_accessible :message, :name, :title, :tag

  has_many :comments, :dependent => :destroy
end
