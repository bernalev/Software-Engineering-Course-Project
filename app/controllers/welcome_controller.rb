class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
  	@schools = School.all
  	@schools_count = @schools.length
  	if (@schools_count >= 10)
  		@schools = @schools[0..9]
  	end

    @groups = Group.all
    @groups_count = @groups.length
    if (@groups_count >= 10)
      @groups = @groups[0..9]
    end

    @tutor_ads = TutorAd.all
    @tutor_ads_count = @tutor_ads.length
    if (@tutor_ads_count >= 10)
      @tutor_ads = @tutor_ads[0..9]
    end

    @colors = ["#4444ff", "#44ff44", "#ff4444"]

  	@activities = PublicActivity::Activity.order("created_at desc").limit(7)
  end
end
