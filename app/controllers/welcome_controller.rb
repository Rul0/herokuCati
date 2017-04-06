class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index]


	def index
    redirect
    @respondent = Respondent.find_by_id rand(Respondent.count) + 1
	end

	private

	def redirect
    if current_user
      if current_user.supervisor_role?
        redirect_to projects_path
      else
        #if current_user.projects.first.nil?
        #  redirect_to edit_user_password_path
        #else
        redirect_to calls_project_path(current_user.projects.first)
        #end
      end
    end
	end



end
