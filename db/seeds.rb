# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rubygems'

admin = User.create!(username: "apuente",
                        email: "apuente@wisc.edu",
                        password: "racine93!",
                        password_confirmation: "racine93!",
                        admin: true)