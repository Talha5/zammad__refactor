require 'rails_helper'

RSpec.describe(FormSchema::Field::Text) do
  subject(:schema) { described_class.new(context: context, **base_attributes, **attributes).schema }

  let(:context) { Struct.new(:current_user, :current_user?) }

  context 'when generating schema information' do
    let(:type) { 'text' }
    let(:base_attributes) do
      {
        name:  'my_field',
        label: 'Label',
        value: 'initial content',
      }
    end
    let(:attributes) do
      {
        placeholder: 'nice placeholder',
        minlength:   20,
        maxlength:   40,
      }
    end

    it 'returns fields' do
      expect(schema).to eq(base_attributes.merge(type: type).merge({ props: attributes }))
    end
  end
end
