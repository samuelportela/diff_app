# Controller responsible for handling all requests related to diffs.
class V1::DiffsController < ApplicationController
  before_action :set_v1_diff, only: [:left, :right, :show]
  
  # Stores left content to be compared.
  # Here is an example on how to call this method using curl:
  # <tt>curl -X POST --data-binary "@left.json" http://localhost:3000/v1/diff/1/left</tt>
  def left
    @v1_diff.left = Base64.decode64(request.body.string)
    @v1_diff.save
  end

  # Stores right content to be compared.
  # Here is an example on how to call this method using curl:
  # <tt>curl -X POST --data-binary "@right.json" http://localhost:3000/v1/diff/1/right</tt>
  def right
    @v1_diff.right = Base64.decode64(request.body.string)
    @v1_diff.save
  end

  # Retrieves diff results.
  # Here is an example on how to call this method using curl:
  # <tt>curl -X GET http://localhost:3000/v1/diff/1</tt>
  #
  # @return JSON object indicating the result of diff.
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #
    # @return Diff object found by id parameter or a new Diff object if not found.
    def set_v1_diff
      @v1_diff = V1::Diff.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      @v1_diff = V1::Diff.new(id: params[:id])
    end
end
