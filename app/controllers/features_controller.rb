class FeaturesController < ApplicationController
  before_action :must_be_logged_in
  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(feature_params)

    if @feature.save
      flash[:notice] = 'Feature was successfully created.'
      redirect_to '/home'
    else
      render :new
    end
  end

  def show
    @feature = Feature.find(params[:id])
  end

  private

  def feature_params
    params.require(:feature).permit(:name, :description)
  end
end
