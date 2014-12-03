class Post < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  
  validates :headline, :source, presence: true
end
