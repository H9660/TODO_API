class CreateSubtasks < ActiveRecord::Migration[7.0]
  def change
    create_table :subtasks do |t|
      t.string :title
      t.boolean :completed
      t.references :task, null: false, foreign_key: true

      t.timestamps
      change_column :subtasks, :completed, :boolean
    end
  end
end
