require 'test_helper'

class RentalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rental = rentals(:one)
  end

  test "should get index" do
    get rentals_url, as: :json
    assert_response :success
  end

  test "should create rental" do
    assert_difference('Rental.count') do
      post rentals_url, params: { rental: { customer_id: @rental.customer_id, inventory_id: @rental.inventory_id, last_update: @rental.last_update, rental_date: @rental.rental_date, return_date: @rental.return_date, staff_id: @rental.staff_id } }, as: :json
    end

    assert_response 201
  end

  test "should show rental" do
    get rental_url(@rental), as: :json
    assert_response :success
  end

  test "should update rental" do
    patch rental_url(@rental), params: { rental: { customer_id: @rental.customer_id, inventory_id: @rental.inventory_id, last_update: @rental.last_update, rental_date: @rental.rental_date, return_date: @rental.return_date, staff_id: @rental.staff_id } }, as: :json
    assert_response 200
  end

  test "should destroy rental" do
    assert_difference('Rental.count', -1) do
      delete rental_url(@rental), as: :json
    end

    assert_response 204
  end
end
