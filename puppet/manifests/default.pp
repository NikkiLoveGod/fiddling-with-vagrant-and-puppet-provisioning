node 'localhost' {
	exec { 'print-out-hello-world':
		command => 'echo "Hello world!"',
		path => '/bin'
	}	
}