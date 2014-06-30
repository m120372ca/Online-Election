class SessionsController < ApplicationController
def log_in
end
def logged_in 
	if session[:voter_id]==nil
		@voter =Voter.find(:all, :conditions=>["id = ? AND password = ?",params[:id],params[:password]])
		if @voter.size!=0
			session[:voter_id]= params[:id]
			flash[:notice] = "Logged in"
		else
			flash[:notice] = "Invalid Voter_Id or Password"
			render :template=> "/sessions/log_in"
		end
	else
		flash[:notice] = "Logged in"
	end
end
def home
end
def edit
	@voter=Voter.find(session[:voter_id])
end
def update
	@voter=Voter.find(session[:voter_id])
	if	@voter.update_attributes(params[:voter])
		redirect_to "/sessions/logged_in"
	else
		render :template=> "/sessions/edit"
	end
end
def voting		
end
def voted
	@candidates= Candidate.find(:all,:conditions=>["id = ? ",params[:id]])
	for candidate in @candidates
		candidate.votes=candidate.votes + 1
		candidate.update_attributes(params[:candidate])
		@voter=Voter.find(session[:voter_id])
		@voter.vote=true
		@voter.update_attributes(params[:voter])
	end
	redirect_to "/sessions/logged_in" 
end
def destroy
	session[:voter_id]=nil
	flash[:notice]=" Logged Out!"
	redirect_to "/sessions" 
end
end
