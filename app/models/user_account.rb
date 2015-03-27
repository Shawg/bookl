class UserAccount < ActiveRecord::Base
	has_many :messages, dependent: :destroy
	has_many :posts, dependent: :destroy

	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }
    # Returns the hash digest of the given string.
  	def UserAccount.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  end

  def self.search(search)
    if search
      UserAccount.find_by_sql ["SELECT *
                              FROM user_accounts
                              WHERE email like :email", {:email => search}]
    end
  end
end
