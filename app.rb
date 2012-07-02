require_relative 'human_titleize'

set :haml, :format => :html5
set :static, true

get '/' do
  question = params[:input]
  if question
    answer = question.proper_titleize
  end
  haml :index, locals: {question: question, answer: answer}
end