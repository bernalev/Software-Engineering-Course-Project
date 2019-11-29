class CreateTutorAds < ActiveRecord::Migration[6.0]
  def change
    create_table :tutor_ads do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.integer :ad_type
      t.text :description
      t.float :rate

      t.timestamps
    end
  end
end
