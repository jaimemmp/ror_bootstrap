class PeopleController < ApplicationController
    before_action :set_movie, except: [:show, :edit, :update, :destroy]

    def index
        @people = @movie.people
    end

    def new
        @person = @movie.people.build
    end

    def show
    end

    def edit
        @person = Person.find(params[:id])
    end

    def create
        @person = @movie.people.build(person_params)
        respond_to do |format|
          if @person.save
            format.html { redirect_to movie_path(@person[:movie_id]), notice: 'Person was successfully created.' }
            format.json { render action: 'show', status: :created, location: @person }
          else
            format.html { render action: 'new' }
            format.json { render json: movie_path(@person[:movie_id]).errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        @person = Person.find(params[:id])
        respond_to do |format|
          if @person.update(person_params)
            format.html { redirect_to movie_path(@person[:movie_id]), notice: 'Person was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: movie_path(@person[:movie_id]).errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @person = Person.find(params[:id])
        @person.destroy
        respond_to do |format|
          format.html { redirect_to movie_path(@person[:movie_id]) }
          format.json { head :no_content }
        end
    end

    private
    def set_movie
        @movie = Movie.find(params[:movie_id])
    end

    def person_params
        params.require(:person).permit(:name, :role, :movie)
    end

end