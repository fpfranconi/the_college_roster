class Micropost < ActiveRecord::Base
  
  attr_accessible :content
  
  validates :content, :length => { :maximum => 140 }
  
  belongs_to :athlete
  
end
