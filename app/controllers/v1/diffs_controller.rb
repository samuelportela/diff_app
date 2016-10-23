class V1::DiffsController < ApplicationController
  before_action :set_v1_diff, only: [:show, :left, :right]

  # curl -X GET http://localhost:3000/v1/diff/1
  def show
  end
  
  # curl -X POST --data-binary "@left.json" http://localhost:3000/v1/diff/1/left
  def left
    @v1_diff.left = Base64.decode64(request.body.string)
    @v1_diff.save
  end
  
  # curl -X POST --data-binary "@right.json" http://localhost:3000/v1/diff/1/right
  def right
    @v1_diff.right = Base64.decode64(request.body.string)
    @v1_diff.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_diff
      @v1_diff = V1::Diff.find_or_initialize_by(id: params[:id])
    end
end
