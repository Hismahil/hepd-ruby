
# ruby

#### Table of Contents

1. [Overview](#overview)

2. [Setup](#setup)
    * [Beginning with ruby](#beginning-with-ruby)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)

## Overview
This module install rubies from Brightbox repository, by have Ruby: 2.3, 2.2, 2.1, 2.0, 1.9.3, and 1.8.7

## Setup

### Beginning with ruby
Just install the following packages: apt, stdlib and this module.

## Usage

```puppet
class { 'ruby':
	version		=> '2.1',
	user		=> 'vagrant'
}
```

## Limitations

Tested only with Ubuntu 14.04.
