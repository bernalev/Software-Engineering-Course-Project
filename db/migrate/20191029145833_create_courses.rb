class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_code
      t.string :course_name
      t.string :department

      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
