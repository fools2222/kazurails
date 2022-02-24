require "test_helper"

class KazmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kazmail = kazmails(:one)
  end

  test "should get index" do
    get kazmails_url
    assert_response :success
  end

  test "should get new" do
    get new_kazmail_url
    assert_response :success
  end

  test "should create kazmail" do
    assert_difference('Kazmail.count') do
      post kazmails_url, params: { kazmail: { email: @kazmail.email, message: @kazmail.message, name: @kazmail.name } }
    end

    assert_redirected_to kazmail_url(Kazmail.last)
  end

  test "should show kazmail" do
    get kazmail_url(@kazmail)
    assert_response :success
  end

  test "should get edit" do
    get edit_kazmail_url(@kazmail)
    assert_response :success
  end

  test "should update kazmail" do
    patch kazmail_url(@kazmail), params: { kazmail: { email: @kazmail.email, message: @kazmail.message, name: @kazmail.name } }
    assert_redirected_to kazmail_url(@kazmail)
  end

  test "should destroy kazmail" do
    assert_difference('Kazmail.count', -1) do
      delete kazmail_url(@kazmail)
    end

    assert_redirected_to kazmails_url
  end
end
