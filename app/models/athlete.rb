# == Schema Information
#
# Table name: athletes
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  gender          :string(255)
#  city            :string(255)
#  state           :string(255)
#  high_school     :string(255)
#  graduation_year :integer
#  height_feet     :integer
#  height_inches   :integer
#  weight          :integer
#  gpa             :decimal(, )
#  sat             :integer
#  act             :integer
#  class_rank      :string(255)
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Athlete < ActiveRecord::Base

  attr_accessible :city, :first_name, :gender, :graduation_year, :high_school, :last_name, :state, :height_feet, :height_inches, :weight, :gpa, :sat, :act, :class_rank, :user_id

  belongs_to :user
  
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_athletes, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                     class_name:  "Relationship",
                                     dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
  validates :city, presence: true
  validates :first_name, presence: true
  validates :graduation_year, presence: true, :inclusion => { :in => 2012..2016}
  validates :high_school, presence: true
  validates :last_name, presence: true
  validates :state, presence: true
  validates :gender, presence: true
  validates :user_id, presence: true
  validates :height_feet, :inclusion => { :in => 1..8}
  validates :height_inches, :inclusion => { :in => 1..12}
  validates :weight, :inclusion => { :in => 1..500}
  validates :gpa, :inclusion => { :in => 0..5}
  validates :sat, :inclusion => { :in => 0..2400}
  validates :act, :inclusion => { :in => 1..36}
  
  default_scope order: 'athletes.user_id DESC'
  
  scope :filter, lambda { |low, high| where(:graduation_year => low..high) }

  def full_name
      "#{first_name} #{last_name}"
  end
  
  def feed
    Micropost.from_athletes_followed_by(self)
  end
  
  def following?(other_athlete)
    relationships.find_by_followed_id(other_athlete.id)
  end

  def follow!(other_athlete)
    relationships.create!(followed_id: other_athlete.id)
  end

  def unfollow!(other_athlete)
    relationships.find_by_followed_id(other_athlete.id).destroy
  end
  
  def self.low_high_graduation_year
      [Athlete.minimum(:graduation_year), Athlete.maximum(:graduation_year)]
  end
  
end
