json.extract! course, :id, :course_id, :comment, :term, :code, :subjects, :continuity_id, :name, :description, :credits, :independentstudy, :requirements, :created_at, :updated_at
json.url course_url(course, format: :json)
