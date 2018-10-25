module Api
  class DocumentsController < ApplicationController
    before_action :set_group, only: %i[create]
    before_action :set_document, only: %i[update destroy]

    # GET /documents
    # GET /documents.json
    def index
      @documents = Document.all
    end

    # POST /documents
    # POST /documents.json
    def create
      @document = Document.new(document_params)

      if @document.save
        render :create, formats: :json
      else
        render json: @document.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /documents/1
    # PATCH/PUT /documents/1.json
    def update
      if @document.update(document_params)
        render :create, formats: :json
      else
        render json: @document.errors, status: :unprocessable_entity
      end
    end

    # DELETE /documents/1
    # DELETE /documents/1.json
    def destroy
      @document.destroy
    end

    private

      # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

      # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:title, :content).merge(group_id: @group.id, user_id: current_user.id)
    end
  end
end
