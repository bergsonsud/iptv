class UrlLinksController < ApplicationController
  before_action :set_url_link, only: [:show, :edit, :update, :destroy]

  # GET /url_links
  # GET /url_links.json
  def index
    @url_links = UrlLink.all
  end

  # GET /url_links/1
  # GET /url_links/1.json
  def show
  end

  # GET /url_links/new
  def new
    @url_link = UrlLink.new
  end

  # GET /url_links/1/edit
  def edit
  end

  # POST /url_links
  # POST /url_links.json
  def create
    @url_link = UrlLink.new(url_link_params)

    respond_to do |format|
      if @url_link.save
        format.html { redirect_to @url_link, notice: 'Url link was successfully created.' }
        format.json { render :show, status: :created, location: @url_link }
      else
        format.html { render :new }
        format.json { render json: @url_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /url_links/1
  # PATCH/PUT /url_links/1.json
  def update
    respond_to do |format|
      if @url_link.update(url_link_params)
        format.html { redirect_to @url_link, notice: 'Url link was successfully updated.' }
        format.json { render :show, status: :ok, location: @url_link }
      else
        format.html { render :edit }
        format.json { render json: @url_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_links/1
  # DELETE /url_links/1.json
  def destroy
    @url_link.destroy
    respond_to do |format|
      format.html { redirect_to url_links_url, notice: 'Url link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url_link
      @url_link = UrlLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_link_params
      params.require(:url_link).permit(:url)
    end
end
