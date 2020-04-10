class FilmSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :rating
end
