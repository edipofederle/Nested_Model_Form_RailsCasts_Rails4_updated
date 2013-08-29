class Answer < ActiveRecord::Base
  # Remove attr_accessible :content, :question_id
  belongs_to :question
end
