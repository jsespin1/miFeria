class MailerControllerMailer < ApplicationMailer
	default from: "miferiadomicilio@gmail.com"

	def sample_email
	    @user = "Usuario Javier cliente"
	    delivery_options = { user_name: "miferiadomicilio@gmail.com",
                         password: "patascortas1",
                         address: "smtp.gmail.com" }
	    mail(to: "js.espinosap@live.com", subject: 'Sample Email', delivery_method_options: delivery_options)
	end
end
