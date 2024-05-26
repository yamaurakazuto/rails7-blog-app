class User < ApplicationRecord
  #postモデルへのアソシエーション
  has_many :posts, dependent: :destroy

#commentモデルへのアソシエーション
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
