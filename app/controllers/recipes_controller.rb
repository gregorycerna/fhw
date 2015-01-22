class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :clear_date]

  respond_to :html

  def index
    @recipes = Recipe.all
    respond_with(@recipes)
  end

  def show
    respond_with(@recipe)
  end

  def new
    @recipe = Recipe.new
    respond_with(@recipe)
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    respond_with(@recipe)
  end

  def update
    @recipe.update(recipe_params)
    respond_with(@recipe)
  end

  def destroy
    @recipe.destroy
    respond_with(@recipe)
  end

  def clear_date
    @recipe.date_to_serve = nil
    @recipe.save!
    redirect_to recipes_path
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    preparse_params
    params.require(:recipe).permit(:name, :url, :date_to_serve, :user_id,
                                   :partner, :ingredients, :day)
  end

  def preparse_params
    if params.has_key?(:recipe) && params[:recipe].has_key?(:day)
      params[:recipe][:day] = Date::DAYNAMES[params[:recipe][:day].to_i]
    end
    if params.has_key?(:recipe) && params[:recipe].has_key?(:date_to_serve)
      begin
        new_date = Date.strptime(params[:recipe][:date_to_serve], "%m/%d/%Y")
      rescue
        begin
          new_date = Date.strptime(params[:recipe][:date_to_serve], "%Y-%m-%d")
        rescue
          new_date = nil
        end
      end
      params[:recipe][:date_to_serve] = new_date
    end
  end
end
