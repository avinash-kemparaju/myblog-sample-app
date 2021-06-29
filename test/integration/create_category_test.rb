require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

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

end
