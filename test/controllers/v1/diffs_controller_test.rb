require 'test_helper'

class V1::DiffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @one = v1_diffs(:one)
  end
  
  test "should post left content" do
    post left_v1_diff_url(@one)
    assert_response :success
  end
  
  test "should post right content" do
    post right_v1_diff_url(@one)
    assert_response :success
  end
  
  test "should show diff result" do
    get v1_diff_url(@one)
    assert_response :success
  end
end
