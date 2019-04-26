class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :type
      t.date :date
      t.text :action
      t.references :friend, foreign_key: true

      t.timestamps
    end
  end
end
