require 'test_helper'

class TracksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get play" do
    get :play
    assert_response :success
  end

  test "should get pause" do
    get :pause
    assert_response :success
  end

  test "should get stop" do
    get :stop
    assert_response :success
  end

  test "should get prev" do
    get :prev
    assert_response :success
  end

  test "should get next" do
    get :next
    assert_response :success
  end

  test "should get upload" do
    get :upload
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
