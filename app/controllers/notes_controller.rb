class NotesController < ApplicationController
  def index
  	@notes = Note.all
  end

  def create
  	@course_instance = CourseInstance.find(params[:course_instance_id])
  	@note = @course_instance.notes.new(note_params)
    @note.file.attach(params[:note][:file])
  	@note.user = User.find_by(id:current_user.id)
  	@note.save
  	redirect_to course_instance_path(@course_instance)
  end

  def destroy
    @note = Note.find(params[:id])
  	#@course_instance = CourseInstance.find(params[:course_instance_id])
  	#@note = @course_instance.notes.find(params[:id])
    @course_instance = @note.course_instance
  	@note.destroy
  	redirect_to course_instance_path(@course_instance)
  end

  def show
    @note = Note.find(params[:id])
    #@course_instance = CourseInstance.find(params[:course_instance_id])
    #@note = @course_instance.notes.find(params[:id])
    @course_instance = @note.course_instance
  end


  private
  	def note_params
  		params.require(:note).permit(:title, :body, :file)
  	end
end
