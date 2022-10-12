require 'rails_helper'

RSpec.describe RuboCop::Cop::Tts::HaveNoOverNotTo, type: :rubocop do

  it 'accepts .to have_no' do
    expect_no_offenses("expect(page).to have_no_css('#elem')")
  end

  context 'with .not_to have' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        expect(page).not_to have_css('#elem')
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Prefer `.to have_no_css` over `.not_to have_css`.
      RUBY

      expect_correction(<<~RUBY)
        expect(page).to have_no_css('#elem')
      RUBY
    end
  end
end
