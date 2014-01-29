# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Role.destroy_all


Role.create(:name => "director")
Role.create(:name => "teacher")
Role.create(:name => "student")

u = User.new(
    :email => "przemyslaw.olesinski@polcode.net",
    :password => 'zaq12wsx'
)
u.add_role :director
u.save!

t = User.new(
    :email => "teacher@example.com",
    :password => 'zaq12wsx'
)
t.add_role :teacher
t.save!


st = User.new(
    :email => "student@example.com",
    :password => 'zaq12wsx'
)
st.add_role :student
st.save!


s = Subject.create(:name => 'Ang', :teacher => t)