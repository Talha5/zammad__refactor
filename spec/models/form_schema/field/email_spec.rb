require 'rails_helper'

RSpec.describe(FormSchema::Field::Email) do
  subject(:schema) { described_class.new(context: context, **base_attributes, **attributes).schema }

  let(:context) { Struct.new(:current_user, :current_user?) }

  context 'when generating schema information' do
    let(:type) { 'email' }
    let(:base_attributes) do
      {
        name:  'my_field',
        label: 'Label',
        value: 'test@example.com',
      }
    end
    let(:attributes) do
      {
        placeholder: 'some@address.tld',
      }
    end

    it 'returns fields' do
      expect(schema).to eq(base_attributes.merge(type: type).merge({ props: attributes }))
    end
  end
end
