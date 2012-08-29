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
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class AthleteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
