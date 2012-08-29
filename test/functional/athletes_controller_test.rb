require 'test_helper'

class AthletesControllerTest < ActionController::TestCase
  setup do
    @athlete = athletes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:athletes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create athlete" do
    assert_difference('Athlete.count') do
      post :create, athlete: { all_american: @athlete.all_american, all_division: @athlete.all_division, all_state: @athlete.all_state, city: @athlete.city, conference_champions: @athlete.conference_champions, first_name: @athlete.first_name, gender: @athlete.gender, graduation_year: @athlete.graduation_year, high_school: @athlete.high_school, last_name: @athlete.last_name, state: @athlete.state, state_champions: @athlete.state_champions }
    end

    assert_redirected_to athlete_path(assigns(:athlete))
  end

  test "should show athlete" do
    get :show, id: @athlete
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @athlete
    assert_response :success
  end

  test "should update athlete" do
    put :update, id: @athlete, athlete: { all_american: @athlete.all_american, all_division: @athlete.all_division, all_state: @athlete.all_state, city: @athlete.city, conference_champions: @athlete.conference_champions, first_name: @athlete.first_name, gender: @athlete.gender, graduation_year: @athlete.graduation_year, high_school: @athlete.high_school, last_name: @athlete.last_name, state: @athlete.state, state_champions: @athlete.state_champions }
    assert_redirected_to athlete_path(assigns(:athlete))
  end

  test "should destroy athlete" do
    assert_difference('Athlete.count', -1) do
      delete :destroy, id: @athlete
    end

    assert_redirected_to athletes_path
  end
end
