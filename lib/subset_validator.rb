class SubsetValidator < ActiveModel::EachValidator
  @@error_message = 'contains an invalid item'

  def validate_each(record, attribute, value)
    unless options[:in].respond_to? :include?
      raise ArgumentError, 'An object with the method include? must be supplied as the :in option of the configuration hash'
    end

    unless value.respond_to? :each
      raise ArgumentError, 'The attribute being validated must respond to #each'
    end
  end
end
