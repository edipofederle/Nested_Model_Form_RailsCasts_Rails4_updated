class Survey < ActiveRecord::Base
  # Remove attr_accessible :name, :questions_attributes
  has_many :questions
  has_many :answers, through: :questions
  # Use reject_if to validate fields for questions and answers
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: proc { |attributes| attributes['content'].blank? }
  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: proc { |attributes| attributes['content'].blank? }
  
end
