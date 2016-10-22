require 'test_helper'

class V1::DiffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @v1_diff = v1_diffs(:one)
  end

  test "should get index" do
    get v1_diffs_url
    assert_response :success
  end

  test "should get new" do
    get new_v1_diff_url
    assert_response :success
  end

  test "should create v1_diff" do
    assert_difference('V1::Diff.count') do
      post v1_diffs_url, params: { v1_diff: { left: @v1_diff.left, right: @v1_diff.right } }
    end

    assert_redirected_to v1_diff_url(V1::Diff.last)
  end

  test "should show v1_diff" do
    get v1_diff_url(@v1_diff)
    assert_response :success
  end

  test "should get edit" do
    get edit_v1_diff_url(@v1_diff)
    assert_response :success
  end

  test "should update v1_diff" do
    patch v1_diff_url(@v1_diff), params: { v1_diff: { left: @v1_diff.left, right: @v1_diff.right } }
    assert_redirected_to v1_diff_url(@v1_diff)
  end

  test "should destroy v1_diff" do
    assert_difference('V1::Diff.count', -1) do
      delete v1_diff_url(@v1_diff)
    end

    assert_redirected_to v1_diffs_url
  end
end
