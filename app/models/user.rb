class User < ApplicationRecord
    belongs_to :company
    has_one :auth
    validates_presence_of :first_name, :last_name, :email, :dob
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    validates :phone, numericality: true, length: { minimum: 9, maximum: 15 }
    validate :valid_dob?
    before_create :check_params

    def self.valid_login?(email, password)
        user = find_by(email: email)
        if user && user.auth.authenticate(password)
            user
        end
    end

    private

    def valid_dob?
        if((dob.is_a?(Date) rescue ArgumentError) == ArgumentError)
            errors.add(:dob, 'Date of Birth is incorrect')
        end
    end

    def check_params
        self.first_name.titleize
        self.last_name.titleize
    end
end
