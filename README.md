# urlshortener [![Build Status](https://travis-ci.org/jorisroovers/urlshortener.svg?branch=master)](https://travis-ci.org/jorisroovers/urlshortener)

Very simple urlshortener service implemented in Ruby.

Primarily for personal learning purposes.

## Getting Started ##

Installation
```bash
vagrant up
vagrant ssh
```
Running tests
```bash
rake
```
Running the development server (with automatic reload)
```bash
rerun "ruby web.rb"
# Point your host machine to http://localhost:4567
```

Managing the redis server
```bash
sudo /etc/init.d/redis_6379 start|stop|restart
```

## Ideas ##
In no particular order:
- Management backend
- URL access counts
- RSpec tests
- Vagrant box provisioning using Ansible
