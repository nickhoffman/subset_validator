class SubsetValidator < ActiveModel::EachValidator
  @@error_message = 'contains an invalid value'

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
