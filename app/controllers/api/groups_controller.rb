module Api
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
      usecase = create_groups(groups_params)
      @group = usecase[:group]
      @gmembers = usecase[:members]
      render :create, formats: :json
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
      params.require(:group).permit(:name, :image, members: [:user_id])
    end

    def create_groups(params)
      members =[]
      group =  Group.create!(name: params[:name], image: params[:image])
      if params[:members].present?
        params[:members].map do |member|
          raise "error" if member.user_id.nil?
          member = Member.create!(user_id: member.user_id, group_id: group.id)
          members.push(member)
        end
      end
      return { group: group, members: members }
    end

  end
