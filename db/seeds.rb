# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

User.create!(email: "user@admin.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)


#On Start up,
#run rails db:migrate
#run bundle exec rake db:seed
