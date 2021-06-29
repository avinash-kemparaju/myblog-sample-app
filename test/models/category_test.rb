require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: 'Sports')
  end

  test 'category should be valid' do
    assert @category.valid?
  end

  test 'name should be present' do
    @category.name = ''
    assert !@category.valid?
  end

  test 'name should be unique' do
    @category.save
    @category2 = Category.new(name: 'Sports')
    assert !@category2.valid?
  end

  test 'name should not be too long' do
    @category.name = 'CA'
    assert !@category.valid?
  end

  test 'name should not be too short' do
    @category.name = 'A' * 100
    assert !@category.valid?
  end

end
