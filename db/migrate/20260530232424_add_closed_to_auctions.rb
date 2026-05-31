class AddClosedToAuctions < ActiveRecord::Migration[8.1]
  def change
    add_column :auctions, :closed, :boolean, default: false, null: false
  end
end
