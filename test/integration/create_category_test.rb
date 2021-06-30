require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

  def setup
    @admin_user = User.create(username: 'Avinash',
                              password: '123456', role: 2,
                              email: 'avinash@test.com')
    sign_in_with_api(@admin_user)
  end

  test 'get new category form and create category' do

    _name = 'Travel'
    get 'categories/new'
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, category: { name: _name }
    end
    follow_redirect!
    assert_response :success
    assert_match _name, response.body
  end


  test 'get new category form and reject empty category' do
    _scenarios = [
      { name: '', error: 'Name can&#x27;t be blank' },
      { name: 'aa', error: 'Name is too short (minimum is 3 characters)' },
      { name: 'a' * 100, error: 'Name is too long (maximum is 30 characters)' }
    ]

    _scenarios.each do |_case|
      get 'categories/new'
      assert_response :success
      assert_no_difference 'Category.count' do
        post categories_path, category: { name: _case[:name] }
      end
      assert_match 'errors', response.body
      assert_select 'div.alert'
      assert_select 'h5.alert-heading'
      assert_match _case[:error], response.body
    end
  end

end
