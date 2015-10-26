class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  validates :content, presence: true
end
