class VotersController < ApplicationController
before_filter :check_logged_in, :only=>[:new, :create, :edit, :update, :destroy]
def new
	@voter=Voter.new
end
def create
	@voter=Voter.new(params[:voter])
	if @voter.save
		redirect_to "/voters"
	else
		render :template=> "voters/new"
	end
end 
def edit
	@voter=Voter.find(params[:id])
end
def update
	@voter=Voter.find(params[:id])
	if	@voter.update_attributes(params[:voter])
		redirect_to "/voters"
	else
		render :template=> "/voters/edit"
	end
end
def find
	@voters= Voter.find(:all, :conditions=>["constituency = ? OR name = ?",params[:search_string],params[:search_string]])
  end
def index
	@voters=Voter.find(:all)
end
def destroy
	@voter=Voter.find(params[:id])
	@voter.destroy
	redirect_to "/voters"
end
 private
	def check_logged_in
		authenticate_or_request_with_http_basic("Candidates") do |username, password| 
			username=="ec" && password=="ec_password"
		end
	end 
end
