require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
<<<<<<< HEAD
  test "should get index" do
    get pets_index_url
=======
  test "should get show" do
    get pets_show_url
>>>>>>> dc6f7c6007e4d683702ab527e8785cbf82d77f92
=======
  test "should get new" do
    get pets_new_url
    assert_response :success
  end

  test "should get create" do
    get pets_create_url
>>>>>>> 12f261e0b0cedf7a8e2dd272d3a01876f341506f
    assert_response :success
  end
end
