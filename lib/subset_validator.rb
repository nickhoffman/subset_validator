class SubsetValidator < ActiveModel::EachValidator
  @@error_message = 'contains an invalid item'
end
