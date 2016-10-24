# Represents the Diff model used by the application.
class V1::Diff < ApplicationRecord

  # Compares left and right contents and returns the result of comparison.
  #
  # @return the diff result as a string or array depending on the left and right values.
  # It will return "Left and Right were not provided yet" if both left and right values were not provided.
  # It will return "Left and Right are equal" if they have the same values.
  # It will return "Left and Right have different sizes" if they have different sizes.
  # It will return an array of offsets and lengths if left and right have the same size but different values.
  def diff_result
    if left.nil? && right.nil? then
      'Left and Right were not provided yet'
    elsif left.eql? right then
      'Left and Right are equal'
    elsif (left.nil? || right.nil?) || (left.size != right.size) then
      'Left and Right have different sizes'
    else
      index = 0
      offset = 0
      length = 0
      
      diffs = Array.new
      left.chars.zip(right.chars).each do |left_char, right_char|
        if (left_char == right_char && length > 0) then
          diffs.push({offset: offset, length: length})
          length = 0
        end
        
        if (left_char != right_char) then
          if (length == 0) then
            offset = index
          end
          length += 1
        end
        index += 1
      end
      
      if (length > 0) then
        diffs.push({offset: offset, length: length})
      end
      
      diffs
    end
  end
end
