class CategoriesController < ApplicationController
  def getCategories
    categories = Categorie.search(params[:query]).reorder(nil)

    respond_to do |format|
      format.json { render json: { categories: categories } }
    end
  end
end
