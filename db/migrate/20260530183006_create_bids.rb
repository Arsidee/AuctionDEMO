class CreateBids < ActiveRecord::Migration[8.1]
  def change
    create_table :bids do |t|
      t.references :lot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
