require "test_helper"

class TransactionhistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transactionhistory = transactionhistories(:one)
  end

  test "should get index" do
    get transactionhistories_url
    assert_response :success
  end

  test "should get new" do
    get new_transactionhistory_url
    assert_response :success
  end

  test "should create transactionhistory" do
    assert_difference('Transactionhistory.count') do
      post transactionhistories_url, params: { transactionhistory: {  } }
    end

    assert_redirected_to transactionhistory_url(Transactionhistory.last)
  end

  test "should show transactionhistory" do
    get transactionhistory_url(@transactionhistory)
    assert_response :success
  end

  test "should get edit" do
    get edit_transactionhistory_url(@transactionhistory)
    assert_response :success
  end

  test "should update transactionhistory" do
    patch transactionhistory_url(@transactionhistory), params: { transactionhistory: {  } }
    assert_redirected_to transactionhistory_url(@transactionhistory)
  end

  test "should destroy transactionhistory" do
    assert_difference('Transactionhistory.count', -1) do
      delete transactionhistory_url(@transactionhistory)
    end

    assert_redirected_to transactionhistories_url
  end
end
