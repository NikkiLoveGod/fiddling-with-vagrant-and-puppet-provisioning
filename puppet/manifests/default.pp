node 'localhost' {
	host { 'publicip':
		ip => '192.168.100.100'
	}	

	class { 'apache': 
		default_vhost => false,
		mpm_module => 'prefork'
	}

	class { 'apache::mod::php':	}

	class { '::mysql::server':
	  root_password           => 'strongpassword',
	  remove_default_accounts => true,
	  override_options        => $override_options
	}

	lamp::project { 'lamp': 
		projectName => 'lamptest',
		projectUser => 'lampuser',
		projectPassword => 'lamppassword'
	}

	lamp::project { 'tump': 
		projectName => 'tumptest',
		projectUser => 'tumpuser',
		projectPassword => 'tumppassword'
	}

	lamp::project { 'timp': 
		projectName => 'timptest',
		projectUser => 'timpuser',
		projectPassword => 'timppassword'
	}
}