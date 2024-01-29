class User < ApplicationRecord
  has_secure_password
  validates :email, :username, :mobile,  presence: true, uniqueness: true 
  validates :mobile, numericality: {only_integer: true}, format: { with: /\d[0-9]\)*\z/, message: "Integer only. No sign allowed." },  length: { :minimum => 10, :maximum => 15 }
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: 'string only' } 
end
