require 'rails_helper'

RSpec.describe UserAccount, type: :model do
	it 'creates user' do
		expect { create(:user_account) }.to change {UserAccount.count}.by(1)
	end
	it 'destoys user' do
		user = create(:user_account)
		expect { user.destroy }.to change {UserAccount.count}.by(-1)
	end
end
