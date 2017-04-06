json.extract! project, :id, :name, :company, :start, :finish, :need, :url, :created_at, :updated_at
json.url project_url(project, format: :json)
