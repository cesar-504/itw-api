class SearchPubsController < ApplicationController
  before_action :set_search_pub, only: [:show, :update, :destroy]

  # GET /search_pubs
  def index
    @search_pubs = SearchPub.all

    render json: @search_pubs
  end

  # GET /search_pubs/1
  def show
    render json: @search_pub
  end

  # POST /search_pubs
  def create
    @search_pub = SearchPub.new(search_pub_params)

    if @search_pub.save
      render json: @search_pub, status: :created, location: @search_pub
    else
      render json: @search_pub.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /search_pubs/1
  def update
    if @search_pub.update(search_pub_params)
      render json: @search_pub
    else
      render json: @search_pub.errors, status: :unprocessable_entity
    end
  end

  # DELETE /search_pubs/1
  def destroy
    @search_pub.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_pub
      @search_pub = SearchPub.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def search_pub_params
      params.fetch(:search_pub, {})
    end
end
