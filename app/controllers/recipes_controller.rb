class RecipesController < ApplicationController
  EDAMAN_URL = "https://api.edamam.com/search"

  def index
  end

  # POST when user submit the ingredient
  # send api request to edaman
  def post_edaman
    params["ingredients"]["list"]
    get
    redirect_to :results
  end

  def results
    @recipe_count = recipe_count
    @recipes
  end

  # private

  def ingridients_list
    list
  end

  # def ingredients_params
  #   params.require(:ingredients).permit(:list)
  # end

  def recipes_from_edaman
    edaman_results["hits"]
  end

  def recipe_count
    edaman_results["hits"].count
  end

  def get_eadman
    @get_eadman ||= HTTParty.get(
      "#{EDAMAN_URL}?" + {
                            app_key: target.app_keys,
                            app_id: target.app_id,
                            q: list
                          }.to_query)
  end

  def edaman_results
    p "I NEED TO PARSE JSON"
    p JSON.parse(get_eadman)
  end

  def querys

  end

  def target
    target ||= PublicValue.find_by(name: "edaman")
  end
end
