class Layout < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    has_many :photos
    validates :name, :description, presence: true
end
