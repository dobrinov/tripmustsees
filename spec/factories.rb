FactoryGirl.define do

  factory :country do
    name "Bulgaria"
    latitude 42.75
    longitude 25.50
  end

  factory :city do
    name "Sofia"
    latitude 42.70
    longitude 23.33

    country
  end

  factory :sight_seeing do
    name "Alexander Nevsky Cathedral"
    latitude 42.695755
    longitude 23.332788

    city
    sight_seeing_category
  end

  factory :sight_seeing_category do
    name "Cathedral"
  end

end
