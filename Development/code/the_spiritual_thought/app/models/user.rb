class User < ActiveRecord::Base
    has_many :journals

    has_secure_password
    validates :name, presence: true , uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

end