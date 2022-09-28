require 'rails_helper'

RSpec.describe 'Getting Started > Agents', type: :system do
  it 'shows password strength error' do
    visit 'getting_started/agents'

    fill_in 'firstname',        with: 'Test'
    fill_in 'lastname',         with: 'Test'
    fill_in 'email',            with: 'admin@example.com'

    click '.btn--success'

    within '.js-danger' do
      expect(page)
        .to have_text("Email address 'admin@example.com' is already used for other user.")
    end
  end
end
