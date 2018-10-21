class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :title, index: true, null: false
      t.text :content, null: false
      t.references :user,  index: true, foreign_key: true
      t.references :group,  index: true, foreign_key: true
      t.timestamps
    end
  end
end
