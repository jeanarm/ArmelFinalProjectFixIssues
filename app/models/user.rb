class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :comments, dependent: :destroy 
         has_many :courses, dependent: :destroy 
         has_many :questions, dependent: :destroy 
         has_one  :profile
         has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
         has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
         has_many :following, through: :active_relationships, source: :followed
         has_many :followers, through: :passive_relationships, source: :follower
        
        
         def follow!(other_user)
          active_relationships.create!(followed_id: other_user.id)
        end
        
        #Check whether you are following
        def following?(other_user)
          active_relationships.find_by(followed_id: other_user.id)
        end
        def unfollow!(other_user)
          active_relationships.find_by(followed_id: other_user.id).destroy
        end
        
        paginates_per 10
        
        end
