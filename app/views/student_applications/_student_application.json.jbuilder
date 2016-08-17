json.extract! student_application, :id, :created_at, :updated_at
json.url student_application_url(student_application, format: :json)