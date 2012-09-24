# == Schema Information
#
# Table name: athletes
#
#  id                   :integer          not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  gender               :boolean
#  city                 :string(255)
#  state                :string(255)
#  high_school          :string(255)
#  graduation_year      :integer
#  all_american         :boolean
#  all_state            :boolean
#  all_division         :boolean
#  state_champions      :boolean
#  conference_champions :boolean
#  user_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Athlete < ActiveRecord::Base

  attr_accessible :city, :first_name, :gender, :graduation_year, :high_school, :last_name, :state, :height_feet, :height_inches, :weight, :gpa, :sat, :act, :class_rank, :user_id

  belongs_to :user
  
  has_many :microposts
  
  validates :city, presence: true
  validates :first_name, presence: true
  validates :graduation_year, presence: true
  validates :high_school, presence: true
  validates :last_name, presence: true
  validates :state, presence: true
  validates :gender, presence: true
  validates :user_id, presence: true
  
  default_scope order: 'athletes.user_id DESC'

  def full_name
      "#{first_name} #{last_name}"
  end

end
