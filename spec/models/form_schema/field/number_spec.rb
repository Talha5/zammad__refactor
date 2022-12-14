require 'rails_helper'

RSpec.describe(FormSchema::Field::Number) do
  subject(:schema) { described_class.new(context: context, **base_attributes, **attributes).schema }

  let(:context) { Struct.new(:current_user, :current_user?) }

  context 'when generating schema information' do
    let(:type) { 'number' }
    let(:base_attributes) do
      { name: 'my_field', label: 'Label', value: '7' }
    end
    let(:attributes) do
      {
        min:  '5',
        max:  '13',
        step: '2',
      }
    end

    it 'returns fields' do
      expect(schema).to eq(base_attributes.merge(type: type).merge({ props: attributes }))
    end
  end
end
