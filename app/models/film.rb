class Film < ApplicationRecord
  belongs_to :language
  belongs_to :original_language
  has_many :film_actors
  has_many :film_categories
  has_many :actors, through: :film_actors
  has_many :categories, through: :film_categories




  def self.find_by_params(key, val)
    return Film.where({"film.#{key}" => val})
  end

  def self.find_by_category(val)
    return Film.joins(:categories).where({"category.name" => val})
  end

  def find_actors
    actors = self.actors
    return actors
  end 

end
