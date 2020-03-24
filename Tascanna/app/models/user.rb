class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

    has_many :tasks, dependent: :destroy # If the user deletes their account then all associated tasks get deleted too

    validate :password_complexity

    def password_complexity
        return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,25}$/

        errors.add :password, 'Complexity requirement not met. Length should be 8-25 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
    end
end
