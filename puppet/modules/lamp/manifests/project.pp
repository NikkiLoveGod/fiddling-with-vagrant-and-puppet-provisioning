define lamp::project (
	$projectName = undef,
	$projectUser = undef,
	$projectPassword = undef
) {
	file { "webroot-${projectName}": 
		path => "/vagrant/webroot/${$projectName}",
		ensure => 'directory'
	}

	host { $projectName:
		ip => '192.168.100.100'
	}

	apache::vhost { $projectName:
	  servername => "${projectName}.dev",
	  port    => '80',
	  docroot => "/vagrant/webroot/${$projectName}",
	}

	mysql::db { "${projectName}_db":
	  user     => "${projectUser}",
	  password => "${projectPassword}",
	  host     => 'localhost',
	  grant    => ['ALL'],
	}
}