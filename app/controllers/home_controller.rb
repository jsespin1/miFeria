class HomeController < ApplicationController

	def index

	end

	def send_index
		puts "Antes de Enviar Correo"
		MailerControllerMailer.sample_email().deliver
		puts "Correo Enviado!"
	end


	
end
