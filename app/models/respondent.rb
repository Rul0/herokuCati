class Respondent < ApplicationRecord
	require 'csv'
	has_many :states
	has_many :projects, through: :states

	def self.import(file,project_id)
	    CSV.foreach(file.path, col_sep: ';',headers: true) do |row|
	      j = row.to_hash
	      @project = Project.find(project_id)
	      puts j
	      if Respondent.exists?(phone: j['phone'])
	      	d=Respondent.find_by(phone: j['phone'])
	      	@project.respondents << d
	      else
	      	@a = Respondent.create! j
	      	@project.respondents << @a
	      end
	      @project.save
	    end
	end
end
