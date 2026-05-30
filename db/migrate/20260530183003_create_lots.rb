class CreateLots < ActiveRecord::Migration[8.1]
  def change
    create_table :lots do |t|
      t.references :auction, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :starting_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
