class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :text
      t.references :user
      t.references :group

      t.timestamps
    end
  end
end
