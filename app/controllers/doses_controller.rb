class DosesController < ApplicationController

  # GET /cocktails/:cocktail_id/doses/new
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  # POST /cocktails/:coctail_id/doses
  def create
    @dose = Dose.new(dose_params)
    # find the right cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])

    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail)
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
