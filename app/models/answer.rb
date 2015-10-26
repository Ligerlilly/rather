class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :picture, presence: true


  validate :answers_count_within_bounds, on: :create

  private

    def answers_count_within_bounds
      errors.add(:base, "Too many answers") if self.question.answers.count > 1
    end
end
