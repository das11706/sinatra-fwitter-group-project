class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password
  has_many :tweets


  def slug
    username.downcase.gsub(" ", "-")
   end
  
   
   def self.find_by_slug(slug)
     User.all.find do |user|
       if user.slug == slug
         user
       end
     end
   end

end
