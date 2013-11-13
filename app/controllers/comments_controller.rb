class CommentsController < ApplicationController
    
    before_action :set_movie, except: [:show, :edit, :update, :destroy]

    def index
        @comments = @movie.comments
    end

    def new
        @comment = @movie.comments.build
    end

    def show
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def create
        @comment = @movie.comments.build(comment_params)
        respond_to do |format|
          if @comment.save
            format.html { redirect_to movie_path(@comment[:movie_id]), notice: 'Comment was successfully created.' }
            format.json { render action: 'show', status: :created, location: @comment }
          else
            format.html { render action: 'new' }
            format.json { render json: movie_path(@comment[:movie_id]).errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        @comment = Comment.find(params[:id])
        respond_to do |format|
          if @comment.update(comment_params)
            format.html { redirect_to movie_path(@comment[:movie_id]), notice: 'Comment was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: movie_path(@comment[:movie_id]).errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        respond_to do |format|
          format.html { redirect_to movie_path(@comment[:movie_id]) }
          format.json { head :no_content }
        end
    end

    private
    def set_movie
        @movie = Movie.find(params[:movie_id])
    end

    def comment_params
        params.require(:comment).permit(:author, :body, :movie)
    end


end
