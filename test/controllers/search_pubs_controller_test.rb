require 'test_helper'

class SearchPubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_pub = search_pubs(:one)
  end

  test "should get index" do
    get search_pubs_url, as: :json
    assert_response :success
  end

  test "should create search_pub" do
    assert_difference('SearchPub.count') do
      post search_pubs_url, params: { search_pub: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show search_pub" do
    get search_pub_url(@search_pub), as: :json
    assert_response :success
  end

  test "should update search_pub" do
    patch search_pub_url(@search_pub), params: { search_pub: {  } }, as: :json
    assert_response 200
  end

  test "should destroy search_pub" do
    assert_difference('SearchPub.count', -1) do
      delete search_pub_url(@search_pub), as: :json
    end

    assert_response 204
  end
end
