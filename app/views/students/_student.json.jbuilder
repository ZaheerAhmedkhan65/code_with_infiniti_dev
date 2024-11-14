json.extract! student, :id, :name, :email, :repository_link, :page_link, :phone, :created_at, :updated_at
json.url student_url(student, format: :json)
