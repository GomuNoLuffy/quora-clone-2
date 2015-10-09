helpers do
  def count_question_upvotes(question)
    question.question_votes.where(updown: true).count
  end

  def count_question_downvotes(question)
    question.question_votes.where(updown: false).count
  end

  def count_answer_upvotes(answer)
    answer.answer_votes.where(updown: true).count
  end

  def count_answer_downvotes(answer)
    answer.answer_votes.where(updown: false).count
  end
end