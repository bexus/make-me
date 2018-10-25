class GroupsController < ApplicationController
  before_action :set_group, only: %i[update destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    if @group.save
      render :create, formats: :json
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    if @group.update(group_params)
      render :create, formats: :json
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def group_params
    params.fetch(:group, {}).permit(:name, :image, user_ids: [])
  end
end
