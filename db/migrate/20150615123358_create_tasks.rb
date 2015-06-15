class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :text
      t.references :user, index: true
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
