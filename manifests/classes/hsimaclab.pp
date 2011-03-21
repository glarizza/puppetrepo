#/etc/puppet/manifests/classes/hsimaclab.pp

class hsimaclab {

	#  Includes
	include studentdata
	include hslabs
	include desktopbackground
	include studentuser
	include printers::hhs_201lab
	include loginhooks

	# Package Names
	$skype = "Skype_2.8.0.851.dmg"
	$flash = "flash10.dmg"
	$flip4mac = "flip4mac.dmg"
	$fireworks = "fireworks8.dmg"

	# Install Required Packages First
	package{"$flash": source => "$pkg_base/$flash"}
	package{"$flip4mac": source => "$pkg_base/$flip4mac"}
	package{"$fireworks": source => "$pkg_base/$fireworks"}
	package { "$skype":
		source => "$pkg_base/$skype",
		provider => appdmg
	}

} # End of Class
