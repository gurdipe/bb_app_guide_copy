class SectorsController < ApplicationController
  # GET /sectors
  # GET /sectors.json

    load_and_authorize_resource
    
  def index
    @sectors = Sector.all(:order => 'LOWER(title)')
    # @sectors = Sector.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sectors }
    end
  end

  # GET /sectors/1
  # GET /sectors/1.json
  def show
    @sector = Sector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json:  @sector }
      format.xml  { render xml:   @sector }

    end
  end

  # GET /sectors/new
  # GET /sectors/new.json
  def new
    @sector = Sector.new
    # @employers = Employer.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sector }
    end
  end

  # GET /sectors/1/edit
  def edit
    @sector = Sector.find(params[:id])
    # @employers = Employer.all

  end

  # POST /sectors
  # POST /sectors.json
  def create
    @sector = Sector.new(params[:sector])

    respond_to do |format|
      if @sector.save
        format.html { redirect_to @sector, notice: 'Sector was successfully created.' }
        format.json { render json: @sector, status: :created, location: @sector }
      else
        format.html { render action: "new" }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sectors/1
  # PUT /sectors/1.json
  def update
    @sector = Sector.find(params[:id])
    # params[:employer][:employer_ids] ||= [] 

    respond_to do |format|
      if @sector.update_attributes(params[:sector])
        format.html { redirect_to @sector, notice: 'Sector was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sectors/1
  # DELETE /sectors/1.json
  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy

    respond_to do |format|
      format.html { redirect_to sectors_url }
      format.json { head :no_content }
    end
  end
end
