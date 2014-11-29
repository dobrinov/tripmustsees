FactoryGirl.define do

  factory :country do
    name "Bulgaria"
    slug
    latitude 42.75
    longitude 25.50
    default_zoom_level 5
  end


  factory :city do
    name "Sofia"
    slug
    latitude 42.70
    longitude 23.33
    default_zoom_level 8

    country
  end

  factory :sight_seeing do
    name "St. Alexander Nevsky Cathedral"
    slug
    latitude 42.695755
    longitude 23.332788

    city
    sight_seeing_category
  end


  factory :sight_seeing_category do
    name "Cathedral"
  end

  factory :location do
    name "The center"
    slug
    latitude 12.34
    longitude -12.34

    city
  end

  sequence :slug do |n|
    "slug_#{(0...12).map { ('a'..'z').to_a[rand(26)] }.join}"
  end

end
