class FunniesController < ApplicationController
  before_action :set_funny, only: [:show, :edit, :update, :destroy]

  # GET /funnies
  # GET /funnies.json
  def index
    @funnies = Funny.all
  end

  # GET /funnies/1
  # GET /funnies/1.json
  def show
  end

  # GET /funnies/new
  def new
    @funny = Funny.new
  end

  # GET /funnies/1/edit
  def edit
  end

  # POST /funnies
  # POST /funnies.json
  def create
    @funny = Funny.new(funny_params)

    respond_to do |format|
      if @funny.save
        format.html { redirect_to @funny, notice: 'Funny was successfully created.' }
        format.json { render action: 'show', status: :created, location: @funny }
      else
        format.html { render action: 'new' }
        format.json { render json: @funny.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funnies/1
  # PATCH/PUT /funnies/1.json
  def update
    respond_to do |format|
      if @funny.update(funny_params)
        format.html { redirect_to @funny, notice: 'Funny was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @funny.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funnies/1
  # DELETE /funnies/1.json
  def destroy
    @funny.destroy
    respond_to do |format|
      format.html { redirect_to funnies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funny
      @funny = Funny.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funny_params
      params.require(:funny).permit(:content, :article_id)
    end
end
