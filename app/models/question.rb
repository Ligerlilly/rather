class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :user
  has_many :clicks, dependent: :destroy

  # method to order by clicks (most)

  # default scope to most recent

  # order by controversial (closest to 50%)
end
