class PuppiesController < ApplicationController
  before_action :set_puppy, only: %i[ show edit update destroy ]

  # GET /puppies or /puppies.json
  def index
    @puppies = Puppy.all
  end

  # GET /puppies/1 or /puppies/1.json
  def show
  end

  # GET /puppies/new
  def new
    @puppy = Puppy.new
  end

  # GET /puppies/1/edit
  def edit
  end

  # POST /puppies or /puppies.json
  def create
    @puppy = Puppy.new(puppy_params)

    respond_to do |format|
      if @puppy.save
        format.html { redirect_to puppy_url(@puppy), notice: "Puppy was successfully created." }
        format.json { render :show, status: :created, location: @puppy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @puppy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puppies/1 or /puppies/1.json
  def update
    respond_to do |format|
      if @puppy.update(puppy_params)
        format.html { redirect_to puppy_url(@puppy), notice: "Puppy was successfully updated." }
        format.json { render :show, status: :ok, location: @puppy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @puppy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puppies/1 or /puppies/1.json
  def destroy
    @puppy.destroy!

    respond_to do |format|
      format.html { redirect_to puppies_url, notice: "Puppy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puppy
      @puppy = Puppy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def puppy_params
      params.require(:puppy).permit(:name, :age, :cuteness, :softness)
    end
end
