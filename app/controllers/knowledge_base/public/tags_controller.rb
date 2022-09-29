class KnowledgeBase::Public::TagsController < KnowledgeBase::Public::BaseController
  def show
    @object  = [:tag, params[:tag]]
    @answers = answers_filter KnowledgeBase::Answer.tag_objects(params[:tag])
  end
end
