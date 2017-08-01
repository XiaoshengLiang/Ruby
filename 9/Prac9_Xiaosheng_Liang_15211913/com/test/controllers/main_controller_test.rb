require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get main_welcome_url
    assert_response :success
  end

  test "should get goodbye" do
    get main_goodbye_url
    assert_response :success
  end

  test "should get input" do
    get main_input_url
    assert_response :success
  end

  test "should get check" do
    get main_check_url
    assert_response :success
  end

  test "should get show" do
    get main_show_url
    assert_response :success
  end

end
