require 'rails_helper'

RSpec.describe(FormSchema::Field::Editor) do
  subject(:schema) { described_class.new(context: context, **base_attributes, **attributes).schema }

  let(:context) { Struct.new(:current_user, :current_user?) }

  context 'when generating schema information' do
    let(:type) { 'editor' }
    let(:base_attributes) do
      { name: 'my_field', label: 'Label' }
    end
    let(:attributes) do
      {}
    end

    it 'returns fields' do
      expect(schema).to eq(base_attributes.merge(type: type).merge({ props: attributes }))
    end
  end

end
