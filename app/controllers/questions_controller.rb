class QuestionsController < ApplicationController
  belongs_to :survey
  has_many :answers
end
