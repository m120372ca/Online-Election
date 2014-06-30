class CandidatesController < ApplicationController
before_filter :check_logged_in, :only=>[:new, :create, :edit, :update, :show, :destroy]
def new
	@candidate=Candidate.new
end
def create
	@candidate=Candidate.new(params[:candidate])
	if @candidate.save
		redirect_to "/candidates/#{@candidate.id}"
	else
		render :template=> "candidates/new"
	end
end
def edit
	@candidate=Candidate.find(params[:id])
end
def update
	@candidate=Candidate.find(params[:id])
	if	@candidate.update_attributes(params[:candidate])
		redirect_to "/candidates/#{@candidate.id}"
	else
		render :template=> "/candidates/edit"
	end
end
def show
	@candidate=Candidate.find(params[:id])
end
def index
	@candidates=Candidate.find(:all)
end
def destroy
	@candidate=Candidate.find(params[:id])
	@candidate.destroy
	redirect_to "/candidates"
end
def find
	@candidates= Candidate.find(:all, :conditions=>["constituency = ? OR party = ?",params[:search_string],params[:search_string]])
  end
private
	def check_logged_in
		authenticate_or_request_with_http_basic("Candidates") do |username, password| 
			username=="ec" && password=="ec_password"
		end
	end
end
