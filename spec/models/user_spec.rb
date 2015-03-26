require 'rspec'

# spec/models/user_spec.rb

# Prefix class methods with a '.'
describe User, '.active' do
  it 'returns only active users' do
    # setup
    active_user = create(:user, active: true)
    non_active_user = create(:user, active: false)

    # exercise
    result = User.active

    # verify
    expect(result).to eq [active_user]

    # teardown is handled for you by RSpec
  end
end