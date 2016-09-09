# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

COLORS = ["black", "white", "orange", "brown"]
SEX = ["M", "F"]
USERS = [1,2,3]
# 30.times do
#   Cat.create!(user_id: USERS.sample,
#   name: Faker::StarWars.character,
#   birth_date: Faker::Date.between(5.year.ago, Date.today), color: COLORS.sample, description: "This cat is from #{Faker::Space.star}", sex: SEX.sample)
# end

# ALLCATS = Cat.all

CAT_IDS = (61..90).to_a
# 10.times do
#   CatRentalRequest.create!(cat_id: ALLCATS.sample.id,
#   start_date: Faker::Date.between(Date.today, 2.month.from_now),
#   end_date: Faker::Date.between(3.month.from_now, 4.month.from_now))
# end


10.times do
  CatRentalRequest.create!(cat_id: CAT_IDS.sample,
  user_id: USERS.sample,
  start_date: Faker::Date.between(Date.today, 2.month.from_now),
  end_date: Faker::Date.between(3.month.from_now, 4.month.from_now))
end
