class Product < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :price
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, format: {with: /\A(\w)+\.(gif|png|bmp)\z/}

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private ##jeżeli produkt jest w koszyku to nie można go usunać z bazy danych
	  def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end



end