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

  attr_accessible :all_american, :all_division, :all_state, :city, :conference_champions, :first_name, :gender, :graduation_year, :high_school, :last_name, :state, :state_champions, :user_id

  belongs_to :user
  
  validates :city, presence: true
  validates :first_name, presence: true
  validates :graduation_year, presence: true
  validates :high_school, presence: true
  validates :last_name, presence: true
  validates :state, presence: true
  validates :user_id, presence: true
  
  default_scope order: 'athletes.user_id DESC'

  def full_name
      "#{first_name} #{last_name}"
  end

end
