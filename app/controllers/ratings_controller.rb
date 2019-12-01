class RatingsController < ApplicationController
	def index 
		@note = Note.find(params[:note_id])
		@ratings = @note.ratings
	end

	def new
		@note = Note.find(params[:note_id])
	end

	def create
		@note = Note.find(params[:note_id])
		@rating = @note.ratings.new(rating_params)
		@rating.user = User.find_by(id:current_user.id)
		@rating.save
		redirect_to note_path(@note)
	end

  	private
  		def rating_params
  			params.require(:rating).permit(:score, :review)
  		end

end
