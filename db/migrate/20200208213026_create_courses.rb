class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_id
      t.string :comment
      t.string :term
      t.string :code
      t.string :subjects
      t.string :continuity_id
      t.string :name
      t.string :description
      t.float :credits
      t.boolean :independentstudy
      t.string :requirements

      t.timestamps
    end
  end
end
