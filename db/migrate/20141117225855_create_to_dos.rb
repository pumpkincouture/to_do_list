class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :list
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
