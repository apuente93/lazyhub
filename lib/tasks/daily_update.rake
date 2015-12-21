namespace :daily_update do
  desc "Old articles are thrown to the back of list query for static pages"
  task my_task: :environment do

  	Article.where("views > ?", 0).update_all(isOld: 'true')
  end
end