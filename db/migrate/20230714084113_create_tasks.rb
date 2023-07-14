class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      #id would be added automatically
      t.string :title
      t.boolean :completed

      t.timestamps  #automatically defined
    end
  end
end
