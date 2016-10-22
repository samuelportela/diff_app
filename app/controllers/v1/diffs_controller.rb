class V1::DiffsController < ApplicationController
  before_action :set_v1_diff, only: [:show, :edit, :update, :destroy]

  # GET /v1/diffs
  # GET /v1/diffs.json
  def index
    @v1_diffs = V1::Diff.all
  end

  # GET /v1/diffs/1
  # GET /v1/diffs/1.json
  def show
  end

  # GET /v1/diffs/new
  def new
    @v1_diff = V1::Diff.new
  end

  # GET /v1/diffs/1/edit
  def edit
  end

  # POST /v1/diffs
  # POST /v1/diffs.json
  def create
    @v1_diff = V1::Diff.new(v1_diff_params)

    respond_to do |format|
      if @v1_diff.save
        format.html { redirect_to @v1_diff, notice: 'Diff was successfully created.' }
        format.json { render :show, status: :created, location: @v1_diff }
      else
        format.html { render :new }
        format.json { render json: @v1_diff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /v1/diffs/1
  # PATCH/PUT /v1/diffs/1.json
  def update
    respond_to do |format|
      if @v1_diff.update(v1_diff_params)
        format.html { redirect_to @v1_diff, notice: 'Diff was successfully updated.' }
        format.json { render :show, status: :ok, location: @v1_diff }
      else
        format.html { render :edit }
        format.json { render json: @v1_diff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v1/diffs/1
  # DELETE /v1/diffs/1.json
  def destroy
    @v1_diff.destroy
    respond_to do |format|
      format.html { redirect_to v1_diffs_url, notice: 'Diff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_diff
      @v1_diff = V1::Diff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def v1_diff_params
      params.require(:v1_diff).permit(:left, :right)
    end
end
