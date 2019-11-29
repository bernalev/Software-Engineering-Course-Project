class Sites::ContactUsController < SitesController
	def create
	    GeneralMailer.with(contact_us_params).contact_us_email.deliver_later
	    flash[:success] = "Email successfully sent!"
	  	render "sites/contact_us"
	end

	private 
  		def contact_us_params
 	  		params.permit(:name, :email, :message)
  		end
end