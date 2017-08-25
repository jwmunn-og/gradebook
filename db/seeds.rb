# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Admin account
User.create(email: "dean.hardscrabble@monsteru.edu", password: 'top_secret', password_confirmation: 'top_secret', admin: true)

user_list = [
  ["professor.knight@monsteru.edu", 'top_secret', 'top_secret'],
  ["frank.mccay@monsteru.edu", 'top_secret', 'top_secret'],
  ["michael.wazowski@monsteru.edu", 'top_secret', 'top_secret'],
  ["randall.boggs@monsteru.edu", 'top_secret', 'top_secret']
]

course_list = [
  [ "Canister Design", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 2 ],
  [ "Cognitive Neuroscience", "Aliquam et ipsum id justo iaculis consequat nec vel metus.", 2 ],
  [ "Scaring 101", "Ut nisl dui, fringilla in suscipit blandit, suscipit ac dolor.", 1 ],
  [ "Molecular Pharmacology", "Mauris eu purus quis massa placerat consequat pellentesque quis magna.", 2 ]
]

user_list.each do |email, password, password_confirmation|
  User.create(email: email, password: password, password_confirmation: password_confirmation)
end

course_list.each do |title, description, user_id|
  Course.create(title: title, description: description, user_id: user_id)
end

students_ids = (3..5).to_a

course_list.length.times do |course_id|
    students_ids.each do |user_id|
      Enrollment.create(user_id: user_id, course_id: course_id + 1, grade: rand(1..4))
    end
end