class Order < ApplicationRecord
  belongs_to :user
  belongs_to :teddy

  monetize :amount_cents
end
