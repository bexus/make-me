module Api
  class MembersController < ApplicationController
    before_action :set_group, only: %i[create]
    before_action :set_member, only: %i[destroy]

    def create
      @member = Member.new(member_params)

      if @member.save
        render :create, formats: :json
      else
        render json: @member.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @member.destroy
    end

    private

      # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:member_id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

      # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:user_id).merge(group_id: @group.id)
    end
  end
end
