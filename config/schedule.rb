# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, {:standard => 'cron.log'}
#
every 2.hours do
	rake "webcrawl_proc:my_task"
end

every 12.hours do
	rake "daily_update:my_task"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
