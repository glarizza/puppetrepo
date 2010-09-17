class nrpe {

	include developertools

	user { 'nagiosuser':
    		comment => 'Nagios User',
    		home => '/Users/nagiosuser',
    		shell => '/bin/bash',
    		ensure => 'present',
    		uid => '5509',
    		gid => '20',
    		password => '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006FB0C42E71F291FC079569DA18EE5A6AE8ED8F1B044227AD0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
	}

	group { 'nagios':
    		members => ['nagiosuser'],
    		ensure => 'present',
    		gid => '5509'
	}

	Package{ensure => installed,provider => pkgdmg}

	# Package Names
	$nrpe = "NRPE_Setup-20100316.dmg"
	$plugins = "Nagios_Plugins-20100316.dmg"
	
	# Package Calls
	package{"$nrpe": 
		source => "pkg_base/$nrpe",
		require => Package[$plugins],
	}

	package{"$plugins":
		source => "pkg_base/$plugins",
		require => User["nagiosuser"],
		before => Package[$nrpe],
	}

}
