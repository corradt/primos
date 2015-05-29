class ComunicationMailer < ActionMailer::Base
	
	def comunication_created(user,comunication)
		@comunication=comunication
		@comunication_user=user

		mail(
				to: "agricolturapermanente@gmail.com",
				from: "agricolturapermanente@gmail.com",
				subject: @comunication.title,
			
			)


	end

end
