require 'rails_helper'

RSpec.describe(FormSchema::Form) do
  it 'lists all available form classes' do
    expect(described_class.forms).to include(FormSchema::Form::Mobile::Login)
  end
end
