class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
  	@schools = School.all
  	@schools_count = @schools.length
  	if (@schools_count > 11)
  		@schools = @schools[0..10]
  	end
  end
end
