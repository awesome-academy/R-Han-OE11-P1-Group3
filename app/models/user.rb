class User < ApplicationRecord
    before_save {email.downcase!}
    before_save:default_value
    validates :username, presence: true, length: {maximum: Settings.users.max_name}, uniqueness: {case_sensitive: false}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: Settings.users.max_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password, presence:true, length: {minimum: Settings.users.min_pass}
    def default_value
        self.is_active= true
        self.is_admin = false
    end
end
