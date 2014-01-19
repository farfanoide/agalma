require 'test_helper'

class Backend::PagesControllerTest < ActionController::TestCase
  setup do
    @backend_page = backend_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_page" do
    assert_difference('Backend::Page.count') do
      post :create, backend_page: { active: @backend_page.active, body: @backend_page.body, slug: @backend_page.slug, title: @backend_page.title }
    end

    assert_redirected_to backend_page_path(assigns(:backend_page))
  end

  test "should show backend_page" do
    get :show, id: @backend_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_page
    assert_response :success
  end

  test "should update backend_page" do
    patch :update, id: @backend_page, backend_page: { active: @backend_page.active, body: @backend_page.body, slug: @backend_page.slug, title: @backend_page.title }
    assert_redirected_to backend_page_path(assigns(:backend_page))
  end

  test "should destroy backend_page" do
    assert_difference('Backend::Page.count', -1) do
      delete :destroy, id: @backend_page
    end

    assert_redirected_to backend_pages_path
  end
end
