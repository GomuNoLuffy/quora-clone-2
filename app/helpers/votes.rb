helpers do
  def check_question_voted(question)
    puts "[LOG] #{question.question_votes.where(user_id: current_user.id).inspect}"
    !question.question_votes.where(user_id: current_user.id).any?
  end

  def check_answer_voted(answer)
    !answer.answer_votes.where(user_id: current_user.id).any?
  end

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