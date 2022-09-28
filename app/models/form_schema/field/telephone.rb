class FormSchema::Field::Telephone < FormSchema::Field::Text
  def self.type
    'tel'
  end
end
