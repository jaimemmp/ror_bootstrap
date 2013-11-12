class CommentsController < ApplicationController
    before_action :set_comment

    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create
    @comment = Comment.new(comment_params)
        respond_to do |format|
          if @comment.save
            format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
            format.json { render action: 'show', status: :created, location: @comment }
          else
            format.html { render action: 'new' }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        respond_to do |format|
          if @comment.update(comment_params)
            format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @comment.destroy
        respond_to do |format|
          format.html { redirect_to comments_url }
          format.json { head :no_content }
        end
    end

    private
    def set_comment
        @comment = Comment.new(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:author, :body, :movie)
    end


end
