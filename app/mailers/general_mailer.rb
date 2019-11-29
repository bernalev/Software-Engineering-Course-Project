class GeneralMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  # TODO a change password email

  def contact_us_email
  	@name = params[:name]
    @email = params[:email]
    @message  = params[:message]
    mail(to: 'e.bernal@mail.utoronto.ca', from: @email,
    	subject: 'A contact us form was sent')
  end
end
