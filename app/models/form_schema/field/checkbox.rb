class FormSchema::Field::Checkbox < FormSchema::Field
  attribute :variant, :options, :onValue, :offValue
end
