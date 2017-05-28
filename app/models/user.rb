class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  has_many :orders
  has_many :products
  has_many :participated_products, :through => :collections, :source => :product
  has_many :collections
<<<<<<< HEAD
  has_many :reviews, dependent: :destroy

=======
>>>>>>> master
  def is_member_of?(product)
    participated_products.include?(product)
  end

  def join!(product)
   participated_products << product
 end

 def quit!(product)
   participated_products.delete(product)
 end
end
