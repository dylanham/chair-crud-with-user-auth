class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.string :name
      t.integer :age

      t.timestamps null: false
    end
  end
end
