json.array!(@people) do |person|
  json.extract! person, :name, :role
  json.url movie_people_url(person, format: :json)
end
