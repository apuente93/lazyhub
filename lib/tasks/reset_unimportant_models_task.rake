namespace :db do
  desc "Sequentially clears out the models I don't care about"
  task :reset_unimportant_models => :environment do
    puts "Clearing out the Comment model"
    Comment.destroy_all
    puts "Finished."
  end
end