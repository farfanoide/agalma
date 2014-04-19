require 'test_helper'

class Backend::ExternalBranchesControllerTest < ActionController::TestCase
  setup do
    @backend_external_branch = backend_external_branches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_external_branches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_external_branch" do
    assert_difference('Backend::ExternalBranch.count') do
      post :create, backend_external_branch: { address: @backend_external_branch.address, description: @backend_external_branch.description, email: @backend_external_branch.email, name: @backend_external_branch.name, zipcode: @backend_external_branch.zipcode, zone: @backend_external_branch.zone }
    end

    assert_redirected_to backend_external_branch_path(assigns(:backend_external_branch))
  end

  test "should show backend_external_branch" do
    get :show, id: @backend_external_branch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_external_branch
    assert_response :success
  end

  test "should update backend_external_branch" do
    patch :update, id: @backend_external_branch, backend_external_branch: { address: @backend_external_branch.address, description: @backend_external_branch.description, email: @backend_external_branch.email, name: @backend_external_branch.name, zipcode: @backend_external_branch.zipcode, zone: @backend_external_branch.zone }
    assert_redirected_to backend_external_branch_path(assigns(:backend_external_branch))
  end

  test "should destroy backend_external_branch" do
    assert_difference('Backend::ExternalBranch.count', -1) do
      delete :destroy, id: @backend_external_branch
    end

    assert_redirected_to backend_external_branches_path
  end
end
