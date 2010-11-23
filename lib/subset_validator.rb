class SubsetValidator < ActiveModel::EachValidator
  @@error_message = 'contains an invalid value'

  # Validate that the specified attribute's value is a subset of another set.
  #
  # Note that this works on more than just arrays, too. It'll work on anything, provided that:
  # * the attribute's value can be anything that responds to <i>#each</i> ;
  # * the set of valid values can be anything that responds to <i>#include?</i> .
  #
  # @example
  #   class User
  #     include ActiveModel::Validations
  #
  #     attr_accessor :roles
  #
  #     @@valid_roles = %w(admin manager developer)
  #
  #     validates :roles, :subset => {:in => @@valid_roles}
  #   end
  #
  #   u       = User.new
  #   u.roles = %w(admin something_else)
  #
  #   u.valid?
  #    => false
  #   u.errors
  #    => {:roles=>["contains an invalid value"]}
  #
  #   u.roles = %w(admin)
  #   u.valid?
  #    => true
  def validate_each(record, attribute, value)
    unless options[:in].respond_to? :include?
      raise ArgumentError, 'An object with the method include? must be supplied as the :in option of the configuration hash'
    end

    unless value.respond_to? :each
      raise ArgumentError, 'The attribute being validated must respond to #each'
    end

    error_message = options[:message] || @@error_message

    value.each do |element|
      unless options[:in].include? element
        record.errors.add attribute, error_message
        break
      end
    end
  end
end
