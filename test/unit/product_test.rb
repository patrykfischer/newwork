require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "should create product with all valid data" do
  	assert Product.new(description:"blabla", image_url:"tee.png", price: "0.01", title: "dupa").valid?
  end

  test "should not create product without description" do
		assert !Product.new(image_url:"tee", price: "0.01", title: "dupa").valid?
  end

  test "should not create product without right price" do
  	p = Product.new(image_url:"tee", title: " dupa", description: "tra lkdslkd") 
  	assert ! p.valid?
  	p = Product.new(image_url:"tee", title: " dupa", description: "tra lkdslkd", price: "-1") 
  	assert ! p.valid?
  	assert p.errors[:price].any?
  end

  test "should create product without title" do
  	p = Product.new(image_url:"tee", price: "10.00", description: "tra lklfkdlfkd")
  	assert ! p.valid?
  	assert p.errors[:title].any?
  end

  test "should create product without valid image_url" do
  	p =Product.new(price: "10.00", description: "dsdsds", title: " deed")
  	assert ! p.valid?
  	assert p.errors[:image_url].any?
  	p = Product.new(price: "10.00", description: "dlsfjfd", title: "kfdsjddfsd", image_url: "kfdjsf")
  	assert ! p.valid?
  	assert p.errors[:image_url].any?
  end

  test "Should not destroy product use in cart" do
    p =Product.new(price: "10.00", description: "dsdsds", title: " deed", image_url: "file.png")
    p.line_items << LineItem.new
    assert ! p.destroy
  end

end 