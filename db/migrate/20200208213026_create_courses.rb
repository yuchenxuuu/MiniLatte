class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses, id: false do |t|
      t.string :id, primary_key: true
      t.string :comment
      t.string :term
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
