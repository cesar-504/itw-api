require 'test_helper'

class ObjectivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @objective = objectives(:one)
  end

  test "should get index" do
    get objectives_url, as: :json
    assert_response :success
  end

  test "should create objective" do
    assert_difference('Objective.count') do
      post objectives_url, params: { objective: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show objective" do
    get objective_url(@objective), as: :json
    assert_response :success
  end

  test "should update objective" do
    patch objective_url(@objective), params: { objective: {  } }, as: :json
    assert_response 200
  end

  test "should destroy objective" do
    assert_difference('Objective.count', -1) do
      delete objective_url(@objective), as: :json
    end

    assert_response 204
  end
end
