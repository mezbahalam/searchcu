class OffendersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_offender, only: [:show, :edit, :update, :destroy]

  # GET /offenders
  # GET /offenders.json
  def index
    @search = Offender.search(params[:q])
    @offenders= @search.result
    @search.build_condition
  end

  def search_home
    @search = Offender.search(params[:q])
    @offenders= @search.result
    @search.build_condition
  end

  # GET /offenders/1
  # GET /offenders/1.json
  def show
  end

  # GET /offenders/new


  # GET /offenders/1/edit


  # POST /offenders
  # POST /offenders.json
  def create
    @offender = Offender.new(offender_params)
    respond_to do |format|
      if @offender.save
        format.html { redirect_to @offender, notice: 'Offender was successfully created.' }
        format.json { render action: 'show', status: :created, location: @offender }
      else
        format.html { render action: 'new' }
        format.json { render json: @offender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offenders/1
  # PATCH/PUT /offenders/1.json
  def update
    respond_to do |format|
      if @offender.update(offender_params)
        format.html { redirect_to @offender, notice: 'Offender was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @offender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offenders/1
  # DELETE /offenders/1.json
  def destroy
    @offender.destroy
    respond_to do |format|
      format.html { redirect_to offenders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offender
      @offender = Offender.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offender_params
      params.require(:offender).permit(:name, :gender, :age, :address, :mobile_no, :occupation, :religion, :educational_background, :crimes, :father_name, :mother_name, :father_occupation, :mother_occupation, :family_income, :psychological_status, :image)
    end
end
