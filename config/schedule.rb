# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, {:standard => 'cron.log'}
#
env 'MAILTO', 'alejandropuentetelle@gmail.com'

set :output, {:error => '~/Desktop/z.error.log', :standard => '~/Desktop/z.standard.log'}

every 1.hour, mailto: 'alejandropuentetelle@gmail.com' do
	rake "webcrawl_proc:my_task"
end

every 7.hours, mailto: 'alejandropuentetelle@gmail.com' do
	rake "daily_update:my_task"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
