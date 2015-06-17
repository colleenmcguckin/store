class CategorizedProduct < ActiveRecord::Base
  belongs_to :category
  belongs_to :product
  has_many :users
  has_many :orders
  has_many :products
end
