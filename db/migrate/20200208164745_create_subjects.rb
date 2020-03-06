class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects, id: false do |t|
      t.string :id, primary_key: true
      t.string :comment
      t.string :term
      t.string :name
      t.string :abbreviation
      t.string :segments

      t.timestamps
    end
  end
end
