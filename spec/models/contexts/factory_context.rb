RSpec.shared_context 'factory' do # rubocop:disable RSpec/ContextWording
  it 'saves successfully' do
    expect(subject).to be_persisted # rubocop:disable RSpec/NamedSubject
  end
end
