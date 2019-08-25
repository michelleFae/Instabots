require "watir"
require_relative 'credentials'
username = $username
password = $password

#open brower and navigate to login
browser = Watir::Browser.new :chrome
browser.goto "instagram.com/accounts/login/"

#navigate to username and password fields, inject info
puts "Logging in!"
browser.text_field(:name => "username").set username
browser.text_field(:name => "password").set password

temp = 0

#Click login button
browser.button(:class => ['_0mzm-','sqdOP','L3NKy']).click

sleep(2)


#because I need to select 'not now' for turning on notifications
#browser.button(:class => 'aOOlW   HoLwm ').click

#sleep(3)

#navigate to my profile
puts "checking followers"
browser.goto "https://www.instagram.com/#{username}"


#click followers
sleep(2)
browser.a(:class, ["-nal3"]).click




#need to get each follower name and check if follower name is in following
#BUG: I CAN'T FIGURE OUT HOW TO ITERATE THROUGH FOLLOWER NAMES... THIS IS NOT WORKING. HELP!
browser.as(:class => "FPmhX notranslate _0imsa").each {
	temp += 1
}

puts temp

puts "done checking followers"

sleep(9915)

