namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(username: "apuente",
                         email: "apuente@wisc.edu",
                         password: "racine93!",
                         password_confirmation: "racine93!",
                         admin: true)
  end
end