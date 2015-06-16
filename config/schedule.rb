# Use this file to easily define all of your cron jobs.
# my codes

# alpha tasks
###
every 1.day, :at => '2:00 am' do
  rake "alpha:alpha1"
end

every 1.day, :at => '2:10 am' do
  rake "alpha:alpha2"
end

every 1.day, :at => '2:20 am' do
  rake "alpha:alpha3"
end

# beta tasks
###

every 1.day, :at => '6:00 am' do
  rake "beta:beta1"
end

every 1.day, :at => '6:10 am' do
  rake "beta:beta2"
end

every 1.day, :at => '6:20 am' do
  rake "beta:beta3"
end

every 1.day, :at => '6:30 am' do
  rake "beta:beta4"
end

every 1.day, :at => '6:40 am' do
  rake "beta:beta5"
end

# Gamma tasks
###

every 1.day, :at => '10:00 am' do
  rake "gamma:gamma1"
end

every 1.day, :at => '10:10 am' do
  rake "gamma:gamma2"
end

every 1.day, :at => '10:20 am' do
  rake "gamma:gamma3"
end

every 1.day, :at => '10:30 am' do
  rake "gamma:gamma4"
end

every 1.day, :at => '10:40 am' do
  rake "gamma:gamma5"
end

every 1.day, :at => '10:50 am' do
  rake "gamma:gamma6"
end

# Delta tasks
###

every 1.day, :at => '2:00 pm' do
  rake "delta:delta1"
end

every 1.day, :at => '2:10 pm' do
  rake "delta:delta2"
end

every 1.day, :at => '2:20 pm' do
  rake "delta:delta3"
end

# Zeta
###

every 1.day, :at => '4:00 pm' do
  rake "zeta:zeta1"
end

# theta
###

every :sunday, :at => '11:20 am' do
  rake "theta:theta1"
end
 
# Omega1
###
every 1.day, :at => '11:00 pm' do
  rake "omega:omega1"
end

# Omega2
###
every 1.day, :at => '11:10 pm' do
  rake "omega:omega2"
end

# Omega3
###
every 1.day, :at => '11:20 pm' do
  rake "omega:omega3"
end

#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
