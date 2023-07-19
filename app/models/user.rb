class User < ApplicationRecord
    has_many :recipes, dependent: :destroy
    has_many :inventory, dependent: :destroy  
end
