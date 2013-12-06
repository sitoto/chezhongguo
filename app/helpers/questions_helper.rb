# coding: utf-8
module QuestionsHelper
  def render_question_node_select_tag(question)
    return if question.blank?
    collection_select :question, :node_id, Node.all,
       :id, :name, {:value => question.node_id,
        :include_blank => false, :prompt => "问题分类"}, :style => "width:145px;"
  end
end
