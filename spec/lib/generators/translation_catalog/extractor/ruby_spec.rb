require 'rails_helper'

RSpec.describe Generators::TranslationCatalog::Extractor::Ruby do
  subject(:extractor_module) { described_class.new }

  let(:filename) { 'myfile' }
  let(:result_strings) do
    extractor_module.extract_from_string(string, filename)
    extractor_module.strings
  end

  context 'with strings to be found' do
    let(:string) do
      <<~'CODE'
        __('__ String')
        =begin
        __('Doc comment must be ignored')
        =end
        __('__ String that only looks like #{interpolation}')
        =begin
        __('Another doc comment must be ignored')
        =end
        Translation.translate('de-de', '.translate String')
        # __('Comments must also be ignored')
        __("__ double quoted String with '")
      CODE
    end

    it 'finds the correct strings' do
      # rubocop:disable Lint/InterpolationCheck
      expect(result_strings).to eq(Set['__ String', '__ String that only looks like #{interpolation}', "__ double quoted String with '", '.translate String'])
      # rubocop:enable Lint/InterpolationCheck
    end
  end

  context 'with strings to be ignored' do
    let(:string) do
      <<~'CODE'
        Translation.translate('de-de', dynamic_variable)
        Translation.translate('de-de', "String with #{interpolation}")
        __('')
      CODE
    end

    it 'does not find strings' do
      expect(result_strings).to eq(Set[])
    end
  end

  context 'with strings too long' do
    let(:string) do
      <<~"CODE"
        __("#{'a' * 3001}")
      CODE
    end

    it 'raises an error' do
      expect { result_strings }.to raise_error(%r{Found a string that longer than than the allowed 3000 characters})
    end
  end
end
