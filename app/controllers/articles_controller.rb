class ArticlesController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_article, only: [:show, :edit, :update, :destroy, :tog]

  # GET /articles
  # GET /articles.json
  def index
    @articles = initialize_grid(Article,
        order:           'articles.created_at',
        order_direction: 'desc',
    )
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    add_breadcrumb @article.name, article_path(@article)

    @comment = Comment.new

    set_meta_tags :title => @article.name,
              :description => @article.description,
              :keywords => @article.keywords
  end

  def tog
     @article.toggle!(:view)
    # @article.save
     redirect_to :back
  end

  def comment_create
    @comment = current_user.comments.build(params[:comment].permit(:text, :user_id, :article_id))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :description, :keywords, :text, :category_id, :user_id, :image, :image_cache, :remove_image, :view)
    end
end
