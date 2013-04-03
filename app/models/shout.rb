class Shout < ActiveRecord::Base
  attr_accessible :message, :name, :title, :tag, :rating
  after_initialize :init

  def init
    self.rating ||= 0
    self.tag ||= "global"
  end

  has_many :comments, :dependent => :destroy
end
