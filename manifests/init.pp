# == Class: ruby
#
# Full description of class ruby here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'ruby':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class ruby(
	$version,
	$user,
) {

	include apt

	Class['apt::update'] -> Class['ruby::dependencies']

	#ruby versions
	$ruby = ["ruby${version}", "ruby${version}-dev"]

	# install dependencies
	class { 'ruby::dependencies': }

	# install a repository for source.list
	apt::ppa { 'ppa:brightbox/ruby-ng': }

	# install rubies
	package { $ruby:
		ensure		=> installed,
		require		=> Class['apt::update']
	}

	# copy .gemrc
	if $user != undef{
		file {
			"/home/${user}/.gemrc":		# current user
			ensure  => present,
			source => 'puppet:///modules/ruby/.gemrc',
		}
	}
		
}
