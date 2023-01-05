require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'opens one bulletin page' do
    bulletin = bulletins(:one)
    get bulletin_url(bulletin)
    assert_response :success
    assert_select 'h1', 'Bulletin 1'
    assert_select 'p', 'Description of Bulletin 1'
  end
end