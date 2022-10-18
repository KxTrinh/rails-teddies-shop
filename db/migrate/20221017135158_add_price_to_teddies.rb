class AddPriceToTeddies < ActiveRecord::Migration[7.0]
  def change
    add_monetize :teddies, :price, currency: { present: false }
  end
end
