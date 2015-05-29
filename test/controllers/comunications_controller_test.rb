require 'test_helper'

class ComunicationsControllerTest < ActionController::TestCase
  setup do
    @comunication = comunications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comunications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comunication" do
    assert_difference('Comunication.count') do
      post :create, comunication: { content: @comunication.content, title: @comunication.title, user_id: @comunication.user_id }
    end

    assert_redirected_to comunication_path(assigns(:comunication))
  end

  test "should show comunication" do
    get :show, id: @comunication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comunication
    assert_response :success
  end

  test "should update comunication" do
    patch :update, id: @comunication, comunication: { content: @comunication.content, title: @comunication.title, user_id: @comunication.user_id }
    assert_redirected_to comunication_path(assigns(:comunication))
  end

  test "should destroy comunication" do
    assert_difference('Comunication.count', -1) do
      delete :destroy, id: @comunication
    end

    assert_redirected_to comunications_path
  end
end
