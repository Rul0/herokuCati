class Project < ApplicationRecord
	has_many :states
	has_many :respondents, through: :states
	has_and_belongs_to_many :users
end
