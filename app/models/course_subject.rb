class CourseSubject < ApplicationRecord
    belongs_to :subject, foreign_key: :subject_id
    belongs_to :course, foreign_key: :course_id
end
