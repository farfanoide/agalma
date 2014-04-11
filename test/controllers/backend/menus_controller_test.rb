require 'test_helper'

class Backend::MenusControllerTest < ActionController::TestCase
  setup do
    @backend_menu = backend_menus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_menu" do
    assert_difference('Backend::Menu.count') do
      post :create, backend_menu: { name: @backend_menu.name }
    end

    assert_redirected_to backend_menu_path(assigns(:backend_menu))
  end

  test "should show backend_menu" do
    get :show, id: @backend_menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_menu
    assert_response :success
  end

  test "should update backend_menu" do
    patch :update, id: @backend_menu, backend_menu: { name: @backend_menu.name }
    assert_redirected_to backend_menu_path(assigns(:backend_menu))
  end

  test "should destroy backend_menu" do
    assert_difference('Backend::Menu.count', -1) do
      delete :destroy, id: @backend_menu
    end

    assert_redirected_to backend_menus_path
  end
end
