class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :notes
      t.date :due_date
      t.boolean :complete
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
