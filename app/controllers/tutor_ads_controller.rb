class TutorAdsController < ApplicationController
  def new
  end
  def create
	  @tutor_ad = TutorAd.new(tutor_ad_params)

	  @tutor_ad.save
	  redirect_to @tutor_ad
  end
  
  def show
	  @tutor_ad = TutorAd.find(params[:id])
  end

  def index
	  @tutor_ads = TutorAd.all
  end

  def show
	  @tutor_ad= TutorAd.find(params[:id])
  end
  private 
  def tutor_ad_params
 	  params.require(:tutor_ad).permit(:title, :offering, :description, :rate)
  end

end

