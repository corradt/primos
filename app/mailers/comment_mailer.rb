class CommentMailer < ActionMailer::Base
	
	def comment_created(current_user,comunication_user,comment_content)
		@current_user=current_user
		@comunication_user=comunication_user
		@comment_content=comment_content
		
		mail(
				to: "agricolturapermanente@gmail.com",
				from: "agricolturapermanente@gmail.com",
				subject: "Un nostro esperto ha appena risposto alla tua comunicazione"
				
			)

	end

end