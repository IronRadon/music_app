class User < ActiveRecord::Base
	attr_accessible :email, :password, :session_token
	before_validation :reset_session_token, :on => :create
	validates :email, :password_digest, :session_token, :presence => true
	validates :email, :session_token, :uniqueness => true

	def password=(password)
		password_digest = BCrypt::Password.create(password)
		self.password_digest = password_digest 
	end

	def is_password?(password)
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end

	def self.generate_session_token
		SecureRandom::urlsafe_base64
	end

	def reset_session_token!
		session_token = User.generate_session_token
		self.session_token = session_token
		self.save!
	end

	def self.find_by_credentials(email, password)
		user = User.where(:email => email).first
		return user if user && user.is_password?(password)
		nil
	end
end