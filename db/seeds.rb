# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

edu_type = Category.create(name: "Educational")
mag_type = Category.create(name: "Magazin")

anon_user = User.create(is_admin: false, name: "Anonymus", email: "Anonymus", username: "Anonymus")
admin_user = User.create(is_admin: true, name: "Ioana", email: "ioana@ioana.com", username: "IoanaBob")

inst1 = Institution.create(
  address: "Strada Vlad Județul 23, București", 
  phone: "0731 007 832", 
  email: "robo@robofun.ro", 
  name: "Robo Fun", 
  contact_name: "Robo", 
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", 
  member_count: "200", 
  women_count: "49",
  category: mag_type
)

inst2 = Institution.create(
  address: "Corp T, Bulevardul Iuliu Maniu 7, București", 
  phone: "0771 466 353", 
  email: "optim@optimus.ro", 
  name: "Optimus Digital", 
  contact_name: "Optimus", 
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", 
  member_count: "10", 
  women_count: "9",
  category: mag_type
)

inst3 = Institution.create(
  address: "Tati Business Center, Bulevardul Tudor Vladimirescu 45, București", 
  phone: "021 305 2400",
  email: "nxp@nap.com", 
  name: "NXP Semiconductors Romania", 
  contact_name: "NXP God", 
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", 
  member_count: "1000", 
  women_count: "10",
  category: edu_type
)

Event.create(
  name: "Robofun",
  starting_date: "2018-04-15 19:00:00",
  ending_date: "2018-04-15 22:00:00",
  capacity: 999,
  institution: inst1,
)

Event.create(
  name: "Ruby Hacknight",
  starting_date: "2018-04-01 18:00:00",
  ending_date: "2018-04-02 00:00:00",
  capacity: 99,
  institution: inst2,
)

Project.create(
  name: "Project X",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet auctor odio, vel congue diam. Sed pulvinar risus quis nisl eleifend lacinia. Sed eu tincidunt felis. Aliquam erat volutpat.",
  women_ratio: 99,
  leader_name: "Ioana Bob",
  institution: inst1
)

Project.create(
  name: "Xamarin time",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet auctor odio, vel congue diam. Sed pulvinar risus quis nisl eleifend lacinia. Sed eu tincidunt felis. Aliquam erat volutpat.",
  women_ratio: 99,
  leader_name: "Alina Pixii",
  institution: inst3
)

Rating.create(
  rating: 5,
  feedback_title: "out of this world",
  feedback_content: "i've never seen a better institution",
  institution: inst1,
  user: anon_user
)

Rating.create(
  rating: 1,
  feedback_title: "horrible",
  feedback_content: "it's not for techies",
  institution: inst2,
  user: admin_user
)