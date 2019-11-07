class CreateCourseInstances < ActiveRecord::Migration[6.0]
  def change
    create_table :course_instances do |t|
      t.integer :year
      t.string :semester
      t.string :professor

      t.references :course, null: false, foreign_key: true


      t.timestamps
    end
  end
end
