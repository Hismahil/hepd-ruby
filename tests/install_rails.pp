node default {
	
	package { 'rails':
		ensure		=> '4.2.1',
		name		=> 'rails,
		provider	=> 'gem',
	}
}