class CreateOlympians < ActiveRecord::Migration[5.2]
  def change
    create_table :olympians do |t|
      t.string :name
      t.string :sex
      t.integer :age
      t.integer :weight
      t.integer :height
      t.string :sport
      t.integer :total_medals_won
    end
  end
end
