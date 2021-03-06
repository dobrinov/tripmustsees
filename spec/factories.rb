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
    capital true
    published true
    population { rand(1..100) }

    country
  end


  factory :location_category do
    name "Cathedral"
  end


  factory :location do
    name "St. Alexander Nevsky Cathedral"
    slug
    latitude 42.695755
    longitude 23.332788
    default_zoom_level 14
    description "Some description text"
    history "Some history text"
    website "http://www.example.com"

    city
    location_category
  end


  factory :image do
    file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'images', 'dummy.jpg')) }
  end


  factory :user do
    email "chuck.norris@example.com"
    first_name "Chuck"
    last_name "Norris"
    provider "facebook"
    uid "123"
  end


  factory :admin_user, :parent => :user do
    admin true
  end


  sequence :slug do |n|
    "slug_#{(0...12).map { ('a'..'z').to_a[rand(26)] }.join}"
  end

end
