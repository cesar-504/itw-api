class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :update, :destroy]

def more
  @publications = Publication.offset(0).last(1).reverse
  render json: @publications,  include: ['user','objective']
end
  # GET /publications
  def index
    count= params[:count] ? params[:count].to_i : 10
    count=100 if count>100
    max_id=params[:max_id].to_i if !params[:max_id].nil?
    since_id=params[:since_id].to_i if !params[:since_id].nil?
    if max_id
      @publications =Publication.where("id< ?",max_id).last(count).reverse
    elsif since_id
      @publications = Publication.where("id> ?",since_id).first(count).reverse
    else
      @publications = Publication.last(count).reverse
    end




    render json: @publications,  include: ['user','objective']
  end

  # GET /publications/1
  def show
    render json: @publication
  end

  # POST /publications
  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      render json: @publication, status: :created, location: @publication
    else
      render json: @publication.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /publications/1
  def update
    if @publication.update(publication_params)
      render json: @publication
    else
      render json: @publication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /publications/1
  def destroy
    @publication.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def publication_params
      params.require(:publication).permit(:title, :content, :user_id, :objective_id)
    end
end
