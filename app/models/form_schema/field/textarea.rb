class FormSchema::Field::Textarea < FormSchema::Field
  attribute :placeholder, :cols, :rows, :minlength, :maxlength
end
