require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class UserTest
  include ActiveModel::Validations

  @@valid_permissions = %w(create retrieve update delete)

  attr_accessor :missing_in
  validates     :missing_in, :allow_blank => true, :subset => true

  attr_accessor :doesnt_respond_to_each
  validates     :doesnt_respond_to_each, :allow_blank => true, :subset => {:in => @@valid_permissions}

  def initialize(params = {})
    params.each {|k, v| send "#{k}=", v}
  end
end

describe SubsetValidator do
  it 'inherits from ActiveModel::EachValidator' do
    SubsetValidator.superclass.should equal ActiveModel::EachValidator
  end

  describe 'class variables' do
    it 'has @@error_message' do
      SubsetValidator.class_variables.should include :@@error_message
    end
  end

  describe '#validate_each' do
    describe "when the configuration hash's :in element is invalid" do
      it 'raises an error' do
        expect {UserTest.new(:missing_in => 'fails').valid?}.to raise_error(
          ArgumentError,
          'An object with the method include? must be supplied as the :in option of the configuration hash'
        )
      end
    end

    describe "when the attribute doesn't respond to #each" do
      it 'raises an error' do
        expect {UserTest.new(:doesnt_respond_to_each => 'fails').valid?}.to raise_error(
          ArgumentError,
          'The attribute being validated must respond to #each'
        )
      end
    end
  end
end
