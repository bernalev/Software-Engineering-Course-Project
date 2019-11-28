class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
  	@schools = School.all
  	@schools_count = @schools.length
  	if (@schools_count > 11)
  		@schools = @schools[0..10]
  	end
=begin
  	@notes = Note.where(course_instance.course: current_user.courses).order("created_at").reverse_order
	@notes_count = @notes.length
  	if (@notes_count > 11)
  		@notes = @notes[0..10]
  	end  

<h2> Browse recent notes from your courses </h2>
<% @notes.each do |note| %>
  <div> <%= link_to note.title, note_path(note, course_instance_id: note.course_instance.id) %> (created <%= note.created_at.to_date %>)</div>
<% end %>
	
=end
  end
end
