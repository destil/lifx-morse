#!/usr/bin/ruby 
# morse.rb
# nemo 2014

require 'lifx'

def init_light(light)
	light.turn_off
end

dot = -> light {
	light.turn_on
	sleep(1)
	light.turn_off
}

dash = -> light {
	light.turn_on
	sleep(2)
	light.turn_off
}

def pause
	sleep(1)
end

alphabet = {
	"a" => [dot,dash],
	"b" => [dash,dot,dot,dot],
	"c" => [dash,dot,dash,dot],
	"d" => [dash,dot,dot],
	"e" => [dot],
	"f" => [dot,dot,dash,dot],
	"g" => [dash,dash,dot],
	"h" => [dot,dot,dot,dot],
	"i" => [dot,dot],
	"j" => [dot,dash,dash,dash],
	"k" => [dash,dot,dash],
	"l" => [dot,dash,dot,dot],
	"m" => [dash,dash],
	"n" => [dash,dot],
	"o" => [dash,dash,dash],
	"p" => [dot,dash,dash,dot],
	"q" => [dash,dash,dot,dash],
	"r" => [dot,dash,dot],
	"s" => [dot,dot,dot],
	"t" => [dash],
	"u" => [dot,dot,dash],
	"v" => [dot,dot,dot,dash],
	"w" => [dot,dash,dash],
	"x" => [dash,dot,dot,dash],
	"y" => [dash,dot,dash,dash],
	"z" => [dash,dash,dot,dot],
	"1" => [dot,dash,dash,dash,dash],
	"2" => [dot,dot,dash,dash,dash],
	"3" => [dot,dot,dot,dash,dash],
	"4" => [dot,dot,dot,dot,dash],
	"5" => [dot,dot,dot,dot,dot],
	"6" => [dash,dot,dot,dot,dot],
	"7" => [dash,dash,dot,dot,dot],
	"8" => [dash,dash,dash,dot,dot],
	"9" => [dash,dash,dash,dash,dot],
	"0" => [dash,dash,dash,dash,dash],
	" " => [ -> light {sleep(1)} ]
}


if(ARGV.length != 1) 
	printf("[!] usage: %s <message>\n",$0)
	exit(1)
end

client = LIFX::Client.lan                  # Talk to bulbs on the LAN
puts "[+] Initializing module"
sleep(1)

message = ARGV[0]
	
light = client.lights.with_label('') 
if light == nil
	puts "[!] error: no light found, exiting...\n";
	exit(1);
end

puts "[+] Found light, continuing."
puts "[+] Turning off light."

printf("[+] Sending message: \"#{message}\"")
message.each_char do |c|
	for f in alphabet[c]
		f.(light)
		pause()
	end
end
		
	
	
