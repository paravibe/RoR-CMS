# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Role.destroy_all

password = BCrypt::Password.create('admin')

role = Role.create({name: 'administrator'})
user = User.create(
    {
        :first_name => 'Super',
        :last_name => 'Admin',
        :email => 'paravibe@gmail.com',
        :password_digest => password,
        :status => 1,
        role_ids: [role.id]
    }
)
