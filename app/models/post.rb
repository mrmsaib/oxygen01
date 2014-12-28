class Post < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :category
  
  validates :headline, :source, presence: true
end
