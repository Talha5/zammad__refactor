require 'rails_helper'

RSpec.describe Authorization, type: :model do
  subject(:authorization) { create(:twitter_authorization) }

  describe 'User assets' do
    it 'does update assets after new authorizations created' do
      authorization.user.assets({})
      create(:twitter_authorization, provider: 'twitter2', user: authorization.user)
      assets = authorization.user.reload.assets({})
      expect(assets[:User][authorization.user.id]['accounts'].keys.count).to eq(2)
    end
  end
end
