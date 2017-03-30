# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ROUND_STATUS = %w(open closed round_1 round_2)

50.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
               email: Faker::Internet.email, password: 'password')
end

50.times do
  Day.create!(cohort_name: Faker::Beer.name,
              pic_url: 'http://weknowyourdreams.com/image.php?pic=/images/fox/fox-04.jpg',
              round_status: ROUND_STATUS.sample, date: rand(DateTime.parse('2015-07-21')..DateTime.now),
              passing_number: rand(2..4), teams_total: rand(6))
end

50.times do
  Pitch.create!(title: Faker::Hipster.sentence(4), blurb: Faker::Hipster.paragraph(3),
                tech_stack: Faker::Hacker.adjective,
                author_id: User.all.sample.id, day_id: Day.all.sample.id)
end

50.times do
  Round.create!(round_number: rand(1..4), day_id: Day.all.sample.id)
end

50.times do
  Vote.create!(voter_id: User.all.sample.id, pitch_id: Pitch.all.sample.id,
               round_id: Round.all.sample.id, points: rand(1..10))
end

User.create!(first_name: 'John', last_name: 'Doe',
             email: 'email@email.com', password: 'password', is_admin: true)