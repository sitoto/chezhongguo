#encoding: utf-8
class QuestionsCell < BaseCell
  helper :nodes

  def sidebar_for_new_question_node(args = {})
    @node = args[:node]
    @action = args[:action]
    render
  end

end
