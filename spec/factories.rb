FactoryGirl.define do

  factory :country do
    name "Bulgaria"
  end

  factory :city do
    name "Sofia"

    country
  end

  factory :sight_seeing do
    name "Rila Monastery"

    city
  end

end
