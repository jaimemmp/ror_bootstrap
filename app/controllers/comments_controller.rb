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
    end

    def create
        @comment = @movie.comments.build(comment_params)
        respond_to do |format|
          if @comment.save
            format.html { redirect_to [@movie, @comment], notice: 'Comment was successfully created.' }
            format.json { render action: 'show', status: :created, location: @comment }
          else
            format.html { render action: 'new' }
            format.json { render json: [@movie, @comment].errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        @comment = @movie.comments.find(params[:id])
        respond_to do |format|
          if @movie.comments.update(comment_params)
            format.html { redirect_to [@movie, @comment], notice: 'Comment was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: [@movie, @comment].errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @comment = @movie.comments.find(params[:id])
        @comment.destroy
        respond_to do |format|
          format.html { redirect_to comments_url(@movie, @comment) }
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
