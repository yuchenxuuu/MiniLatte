class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :subject_id
      t.string :comment
      t.string :term
      t.string :name
      t.string :abbreviation
      t.string :segments

      t.timestamps
    end
  end
end
