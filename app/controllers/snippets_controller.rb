class SnippetsController < ApplicationController

   def snippet_params
     params.require(:snippet).permit(:title, :body, :language_id)
   end

  def index

  end
  def new
   @snippet = Snippet.new
  end

  def create
   language = Language.find snippet_params[:language_id]

   snippet_params[:body] = "~~~~~#{language.name.downcase}\n#{snippet_params[:body]}\n~~~~~"

   @snippet = Snippet.new snippet_params
   if @snippet.save
     redirect_to snippet_path(@snippet)
   else
     render :new
   end
  end

 def show
   @snippet = Snippet.find params[:id]
  #  @body = Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(@snippet.work)
 end

end
