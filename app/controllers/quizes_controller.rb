class QuizesController < ApplicationController
  before_action :set_quize, only: [:show, :edit, :update, :destroy]

  # GET /quizes
  # GET /quizes.json
  def index
    @quizes = Quize.all
  end

  # GET /quizes/1
  # GET /quizes/1.json
  def show
  end

  # GET /quizes/new
  def new
    @quize = Quize.new
  end

  # GET /quizes/1/edit
  def edit
  end

  # POST /quizes
  # POST /quizes.json
  def create
    @quize = Quize.new(quize_params)

    respond_to do |format|
      if @quize.save
        format.html { redirect_to @quize, notice: 'Quize was successfully created.' }
        format.json { render :show, status: :created, location: @quize }
      else
        format.html { render :new }
        format.json { render json: @quize.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizes/1
  # PATCH/PUT /quizes/1.json
  def update
    respond_to do |format|
      if @quize.update(quize_params)
        format.html { redirect_to @quize, notice: 'Quize was successfully updated.' }
        format.json { render :show, status: :ok, location: @quize }
      else
        format.html { render :edit }
        format.json { render json: @quize.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizes/1
  # DELETE /quizes/1.json
  def destroy
    @quize.destroy
    respond_to do |format|
      format.html { redirect_to quizes_url, notice: 'Quize was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quize
      @quize = Quize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quize_params
      params.require(:quize).permit(:student_id, :names, :quiz, :marks, :average_out_of15, :course_id)
    end
end
