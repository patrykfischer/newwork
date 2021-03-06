require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: {  title: @product.title, description: @product.description, image_url: @product.image_url, price: @product.price }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should not create product without full data" do
    assert_difference('Product.count',0) do
      post :create, product: { title: nil, description: @product.description}
    end

    assert_template :new
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: {  title: @product.title, description: @product.description, image_url: @product.image_url, price: @product.price }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end
    assert_redirected_to products_path
  end

  test "should not update product without right date" do
    assert_difference("Product.count",0)do
      post :update, id: @product, product: {  title: nil, description: @product.description, image_url: "product", price: @product.price }
    end
    assert_template :edit
  end


end
