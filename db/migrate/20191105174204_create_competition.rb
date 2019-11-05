class CreateCompetition < ActiveRecord::Migration[5.2]
  def change
    create_table :competitions do |t|
      t.string :medal
      t.references :olympian, foreign_key: true
      t.references :event, foreign_key: true
    end
  end
end
