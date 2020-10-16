require 'test_helper'

class InformationssControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get informationss_index_url
    assert_response :success
  end
end
