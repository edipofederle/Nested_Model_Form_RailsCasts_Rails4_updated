class Question < ActiveRecord::Base
  # Remove attr_accessible :content, :survey_id, :answers_attributes
  belongs_to :survey
  has_many :answers
  # Use reject_if to validate fields for answers
  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: proc { |attributes| attributes['content'].blank? }
end
