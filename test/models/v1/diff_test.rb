require 'test_helper'

class V1::DiffTest < ActiveSupport::TestCase
  test "should result in a message saying that left and right were not provided yet" do
    diff = V1::Diff.new
    diff.save
    assert_equal('Left and Right were not provided yet', diff.diff_result)
  end
  
  test "should result in a message saying that left and right are equal" do
    diff = V1::Diff.new
    diff.left = "{\"foo\":\"bar\"}"
    diff.right = "{\"foo\":\"bar\"}"
    diff.save
    assert_equal('Left and Right are equal', diff.diff_result)
  end
  
  test "should result in a message saying that left and right have different sizes" do
    diff = V1::Diff.new
    diff.left = "{\"foo\":\"bar\"}"
    diff.right = "{\"fooooo\":\"bar\"}"
    diff.save
    assert_equal('Left and Right have different sizes', diff.diff_result)
  end
  
  test "should provide insight in where the diffs are" do
    diff = V1::Diff.new
    diff.left = "{\"foo\":\"bar\"}"
    diff.right = "{\"fee\":\"bur\"}"
    diff.save
    assert_equal([{offset: 3, length: 2}, {offset: 9, length: 1}], diff.diff_result)
  end
end
