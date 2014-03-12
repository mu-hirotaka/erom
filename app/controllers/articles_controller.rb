class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    if @articles.size > 0
      @articles.sort_by! { |article| - article.id }
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def good
    @article = Article.find(params[:id])
    @article.update_attributes(:total_point => @article.total_point + 1)
    redirect_to @article.url
#    redirect_to :controller => "index", :action => "index"
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  def old
    @articles = Article.all.find_all { |article| ((params[:id].to_i - article.id) > 0) && ((params[:id].to_i - article.id) <= 3) }
    @articles.sort_by! { |article| - article.id }
    older_article = @articles.min_by { |article| article.id }
    html = render_to_string partial: 'articles/more'
    render json: { html: html, id: older_article.id }
  end

end
