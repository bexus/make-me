class MembersController < ApplicationController
  before_action :set_member, only: %i[destroy]

  def index
    @members = Member.all
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      render :show, status: :created, location: @member
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
    @member = Member.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def member_params
    params.fetch(:member, {})
  end
end
