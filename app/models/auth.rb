class Auth < ApplicationRecord
    has_secure_password
    has_secure_token
    belongs_to :user
    before_create :generate_auth_token
    validates_associated :user

    private


    def generate_auth_token
        SecureRandom.uuid.gsub(/\-/,'')
    end

    # This method is not available in has_secure_token
    def invalidate_token
        self.update_columns(token: nil)
    end
end
