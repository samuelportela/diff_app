class V1::Diff < ApplicationRecord
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
