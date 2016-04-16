# == Class: ruby
#
# Ruby class for install rubies from brightbox
#
# === Parameters
#
# [*version*]
#   Ruby version from ppa:brightbox
#
# [*user*]
#	Current user on node for copy .gemrc 
#
# === Variables
#
# [*rubyXX*]
#   Package name of ruby version
#
# [*rubyXX-dev]
#	Package development 
#
# === Examples
#
#  class { 'ruby':
#    version 	=> '2.3',
#	 user		=> 'vagrant'
#  }
#
# === Authors
#
# Hismahil E. P. Dinis <hismahilepd@gmail.com>
#
# === Copyright
#
# Copyright 2016 Hismahil E. P. Dinis
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
