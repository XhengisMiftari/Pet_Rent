require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  test "should get index" do
    get pets_index_url
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
