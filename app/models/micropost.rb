# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  athlete_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Micropost < ActiveRecord::Base
  
  attr_accessible :content
  
  belongs_to :athlete
  
  validates :content, presence: true, length: { maximum: 140 }
  validates :athlete_id, presence: true

  default_scope order: 'microposts.created_at DESC'
  
  # Returns microposts from the users being followed by the given user.
  def self.from_athletes_followed_by(athlete)
    followed_athlete_ids = "SELECT followed_id FROM relationships
                            WHERE follower_id = :athlete_id"
    where("athlete_id IN (#{followed_athlete_ids}) OR athlete_id = :athlete_id", 
              athlete_id: athlete.id)
  end
  
end
