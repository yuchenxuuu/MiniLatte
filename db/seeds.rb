# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'rubygems'
require 'activerecord-import'
require 'pathname'

subject_data = JSON.parse(File.read(Rails.root.join('db','subject.json')))
course_data = JSON.parse(File.read(Rails.root.join('db','course.json')))
instructor_data = JSON.parse(File.read(Rails.root.join('db','instructor.json')))


Subject.delete_all
Course.delete_all
Instructor.delete_all

#read the data from subject file and stor in database
subjects = []
subjects_columns = [:subject_id, :name, :term, :abbreviation, :comment, :segments]
subject_data.each do |row|
    segmentArray = row['segments']
    segemntsID = ""
    segmentArray.each do |subject|
        segemntsID  += subject['id']
    end
   

    subjects << {
                    subject_id: row['id'],
                    name: row['name'],
                    term: row['term'],
                    abbreviation: row['abbreviation'],
                    comment: row['comment'],
                    segments: segemntsID
                }
end
#import the array of data into the database
Subject.import subjects_columns, subjects, validate: false

#read the data from subject file and stor in database
courses = []
course_subjects = []
course_subject_column = [:course_id, :subject_id]
courses_columns = [:course_id, :comment, :term, :code, :subjects, :continuity_id, :name, :description, :credits, :independentstudy, :requirements]
course_data.each do |row|
    subjectArray = row['subjects']
    subjectInfo = ""
    requirementArray = row['requirements']
    requirementInfo = ""
    subjectArray.each do |subject|
        course_subjects << {
                                course_id: row['code'], 
                                subject_id: subject['id']
                            }
    end
    courses << {
                    course_id: row['id'],
                    comment: row['comment'],
                    term: row['term'],
                    code: row['code'],
                    subjects: subjectInfo,
                    continuity_id: row['continuity_id'],
                    name: row['name'],
                    description: row['description'],
                    credits: row['creadits'],
                    independentstudy: row['independentstudy'],
                    requirements: requirementInfo 
                }
    
end
#import the array of data into the database
Course.import courses_columns, courses, validate: false
CourseSubject.import course_subject_column, course_subjects 

instructors = []
instructors_columns = [:instructor_id,:comment, :email, :first, :middle, :last]

instructor_data.each do |row|
    instructors << {
                    instructor_id: row['id'],
                    comment: row['comment'],
                    email: row['email'],
                    first: row['first'],
                    middle: row['middle'],
                    last: row['last']
                    }
end
#import the array of data into the database
Instructor.import instructors_columns, instructors, validate: false



