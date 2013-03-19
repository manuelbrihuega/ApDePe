require 'test_helper'

class PublishersControllerTest < ActionController::TestCase
  setup do
    @publisher = publishers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publishers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publisher" do
    assert_difference('Publisher.count') do
      post :create, :publisher => {:name => 'Manuel'} 
    end

    assert_redirected_to publisher_path(assigns(:publisher))
  end

  test "should show publisher" do
    get :show, id: @publisher.to_param
    assert_response :success
    #assert_tag "h1", :content => Publisher.find(publishers(:one).id).name
  end

  test "should get edit" do
    get :edit, id: @publisher.to_param
    assert_response :success
  end

  test "should update publisher" do
     put :update, id: @publisher.to_param, :publisher => {:name => 'Nuevo nombre del editor'}
     assert_redirected_to publisher_path(assigns(:publisher))
     assert_equal 'Nuevo nombre del editor', Publisher.find(publishers(:one).id).name   
  end

  test "should destroy publisher" do
    assert_difference('Publisher.count', -1) do
      delete :destroy, id: @publisher.to_param
    end

    assert_redirected_to publishers_path
  end
end
