require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe SubsetValidator do
  it 'inherits from ActiveModel::EachValidator' do
    SubsetValidator.superclass.should equal ActiveModel::EachValidator
  end
end
