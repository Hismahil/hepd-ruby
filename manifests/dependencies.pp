class ruby::dependencies{
	$dep = ['build-essential','bison','libreadline6','libreadline6-dev','curl','git-core', 'zlibc', 'zlib1g-dev', 'zlib1g', 'libyaml-dev','libsqlite3-0','libsqlite3-dev','sqlite3','libxml2-dev', 'openssl', 'autoconf','libc6-dev', 'software-properties-common', 'nodejs', 'libmysqlclient-dev']

    package { $dep:
    	ensure		=> installed,
    }
}