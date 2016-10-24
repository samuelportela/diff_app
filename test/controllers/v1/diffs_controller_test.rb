require 'test_helper'

# Integration tests to for the application features.
class V1::DiffsControllerTest < ActionDispatch::IntegrationTest
  test "should post left content" do
    assert_difference('V1::Diff.count') do
      post left_v1_diff_url(V1::Diff.new({id: 1}), 'eyJmb28iOiJiYXIifQ==')
    end
    assert_response :success
  end
  
  test "should post right content" do
    assert_difference('V1::Diff.count') do
      post right_v1_diff_url(V1::Diff.new({id: 1}), 'eyJmZWUiOiJidXIifQ==')
    end
    assert_response :success
  end

  test "should retrieve diff result" do
    post left_v1_diff_url(V1::Diff.new({id: 1}), 'eyJmb28iOiJiYXIifQ==')
    diff = V1::Diff.find(1)
    post right_v1_diff_url(diff, 'eyJmZWUiOiJidXIifQ==')
    get v1_diff_url(diff)
    assert_response :success
  end
end
