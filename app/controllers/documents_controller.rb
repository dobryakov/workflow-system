class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
    respond_to do |format|
      format.json {
        render :json => @documents, :layout => false
      }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    respond_to do |format|
      format.json {
        render :json => @document, :layout => false
      }
    end
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        #format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :json => @document, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        #format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :json => @document, status: :ok }
      else
        #format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      #format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      if params[:attach_id]
        @document = Attach.find(params[:attach_id]).attachable
      else
        @document = Document.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.permit( :title, :full_url, :type, :attach_id )
    end
end
