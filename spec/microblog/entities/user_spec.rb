require 'spec_helper'

describe User do
  describe '#password=' do
    let(:user) { User.new }
    let(:password) { '123' }
    let(:password_hash) { BCrypt::Engine.hash_secret(password, user.password_salt) }

    it 'generates salt and hash' do
      user.password = password
      user.password_salt.wont_be_nil
      user.password_hash.must_equal password_hash
    end
  end

  describe '#full_name' do
    let(:user) { User.new(first_name: 'Jo', last_name: 'Mo') }

    it 'returns full name' do
      user.full_name.must_equal 'Jo Mo'
    end
  end
end
