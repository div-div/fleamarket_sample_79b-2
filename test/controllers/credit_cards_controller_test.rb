require 'test_helper'

class CreditCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get credit_cards_index_url
    assert_response :success
  end

  test "should get new" do
    get credit_cards_new_url
    assert_response :success
  end

  test "should get create" do
    get credit_cards_create_url
    assert_response :success
  end

  test "should get edit" do
    get credit_cards_edit_url
    assert_response :success
  end

  test "should get delete" do
    get credit_cards_delete_url
    assert_response :success
  end

end
