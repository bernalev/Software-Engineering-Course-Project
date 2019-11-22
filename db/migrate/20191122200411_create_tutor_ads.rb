class CreateTutorAds < ActiveRecord::Migration[6.0]
  def change
    create_table :TutorAds do |t|
      t.string :title ,:type  
      t.text :body 
      t.float :rate 
      t.references :user, null:false, foreign_key:true
    end
  end
end 
