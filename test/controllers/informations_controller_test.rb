require 'test_helper'

class InformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get resource" do
    get informations_resource_url
    assert_response :success
  end

end
