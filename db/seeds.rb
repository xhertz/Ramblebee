# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create(:email => 'carl.greenwood@gmail.com', :password => 'fdr2yakk')

Tour.create(:name => 'Vancouver', :user_id => 1)

Point.create(:name => 'Airport', :latitude => 49.1919444444, :longitude => -123.1813888889, :gmaps => true)
