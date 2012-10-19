# == Schema Information
#
# Table name: athletes
#
<<<<<<< HEAD
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
=======
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
>>>>>>> 5b8afc67183b26786e60a3c658bc64b97ea23e02
#

require 'test_helper'

class AthleteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
