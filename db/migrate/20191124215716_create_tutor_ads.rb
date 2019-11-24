class CreateTutorAds < ActiveRecord::Migration[6.0]
  def change
    create_table :tutor_ads do |t|
      t.string :title
      t.string :offering
      t.text :description
      t.float :rate

      t.timestamps
    end
  end
end
