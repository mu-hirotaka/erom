class ArticleCommentsController < ApplicationController

  def index
    @article_comments = ArticleComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @article_comments }
    end
  end

  def show
    @article_comment = ArticleComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article_comment }
    end
  end

  def new
    @article_comment = ArticleComment.new

    if params[:article_id].to_i > 0
      @article_id = params[:article_id]
    else
      @article_id = 0
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article_comment }
    end
  end

  def edit
    @article_comment = ArticleComment.find(params[:id])
  end

  def create

    elapsed_time = (params[:article_comment][:hour]).to_i * 3600 + (params[:article_comment][:minute]).to_i * 60 + (params[:article_comment][:second]).to_i
    create_record = {
      :article_id => params[:article_comment][:article_id],
      :comment => params[:article_comment][:comment],
      :elapsed_time => elapsed_time
    }

    @article_comment = ArticleComment.new(create_record)

    respond_to do |format|
      if @article_comment.save
        format.html { redirect_to @article_comment, notice: 'ArticleComment was successfully created.' }
        format.json { render json: @article_comment, status: :created, location: @article_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @article_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @article_comment = ArticleComment.find(params[:id])

    elapsed_time = (params[:article_comment][:hour]).to_i * 3600 + (params[:article_comment][:minute]).to_i * 60 + (params[:article_comment][:second]).to_i
    update_column = {
      :comment => params[:article_comment][:comment],
      :elapsed_time => elapsed_time
    }
    respond_to do |format|
      if @article_comment.update_attributes(update_column)
        format.html { redirect_to @article_comment, notice: 'ArticleComment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article_comment = ArticleComment.find(params[:id])
    @article_comment.destroy

    respond_to do |format|
      format.html { redirect_to article_comments_url }
      format.json { head :no_content }
    end
  end

end
