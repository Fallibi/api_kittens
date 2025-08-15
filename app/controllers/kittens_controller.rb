class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  # GET /kittens or /kittens.json
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kittens }
    end
  end

  # GET /kittens/1 or /kittens/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kitten }
    end
  end

  # GET /kittens/new
  def new
    @kitten = Kitten.new
  end

  # GET /kittens/1/edit
  def edit
  end

  # POST /kittens
  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten, notice: 'Kitten was successfully created! So cute! 😺'
    else
      flash.now[:alert] = 'Error! Your kitten could not be saved. Try again! 😿'
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kittens/1
  def update
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: 'Kitten was successfully updated.'
    else
      flash.now[:alert] = 'Error! Your kitten could not be updated.'
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /kittens/1
  def destroy
    @kitten.destroy
    redirect_to kittens_url, notice: 'Kitten was successfully deleted. Bye bye, kitty.', status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kitten
      @kitten = Kitten.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
