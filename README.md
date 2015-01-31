saltbase
========

A basic server configuration using SaltStack masterless-minion. No webserver or db included.

## About
This is a basic server configuration representing the minimal configuration for a new server using a masterless salt-minion; Salt Masterless. Some of the configuration information is there for illustrative purposes and should be changed to suit your needs. However, the end state of your system, once Salt has been run is a properly configured and usable server, aside from user information, group information, and any firewall rules that need to be added to suit your needs.

This does not include databases, web-servers, or any programming languages beyond those that are included with the distribution.

### Master-Minion
Even though this repo is setup for running Salt masterless minions, it can be used as a basis for a Salt Master-Minion setup. To do so, you will need a Salt Master and the `minion` file will need to be modified to use a master. For more information: http://docs.saltstack.com/en/latest/ref/configuration/minion.html

## Usage
Fork this repo, customize to your needs, and run on the desired server. No Salt master is required. `salt`, `pillar`, and `minion` should be placed in `/srv/`. 

Bootstrap Salt Minion:

    wget -O - https://bootstrap.saltstack.com | sudo sh
	
To run:

    salt-call --local state.highstate

For more information on Salt Masterless: http://docs.saltstack.com/en/latest/topics/tutorials/quickstart.html

## Salt: Information About Basic's States and Pillars

### Formulas
Some of the configuration is done via [Salt Formulas](https://github.com/saltstack-formulas).

The idiomatic way to use salt formulas is to fork each salt-formula repository, install GitFS, and add the Formula repository URLs `gitfs_remotes`. With Salt v2014.7.1 masterles minions support GitFS. 

However, to make this repository easier to use, the pertinant parts of the Salt Formulas have been copied into is with the Formula directories are renamed to drop the `-formula` part of the name. If the formula had a `LICENSE` file, a copy of it will be within its renamed directory. 

This also makes it so that Salt v2014.7.1 is not a requirement to use this repository with a masterless minion, which at time of writing, 2014-01, is not available as a package.

### `salt/date`
Runs a command to write the current datetime to a tmp file.

### `salt/git`
Installs `git` from the distribution's repo.

### `salt/hosts`
Defines the configuration of the `/etc/hosts` file.

### `salt/iptables`
Installs and configures `iptables` firewall and configures the server to reload the rules on restart.

### `salt/locale`
Defines the locale information for the server.

### `salt/logrotate`
Installs and configures `logrotate`.

### `salt/ntp`
Installs `ntp`.

### `salt/openssh`
Installs and configures `openssh`. Logins are by private/public key based authentication only; password logins are not allowed. To cut down on unwanted login attempts, move the port from its default 22 to some other port < 1024. Ports > 1024 should not be used for `ssh` as they are not privileged ports; normal users are allowed to run servers on them. Only privileged accounts are allowed to run servers on TCP/IP ports < 1024; helping to ensure the legitimacy of the services running on these privileged ports.

### `salt/sudo`
Installs `sudo` and adds the sudoers information. 

### `salt/timezone`
Sets the server's timezone. By default, this is `GMT`

### `salt/users`
Sets up users and groups.

### `salt/vim`
Installs vim.

## Pillars
Configurable values are contained within Salt's pillar. Pillar's can contain sensitive information and, in general, should not be part of publicly available repositories. Once you modify the `users` pillar with valid information, DO NOT make the repository public as this will allow your username, password hash, and public key file to be harvestable.

### `pillar/groups.sls`
Defines and `admin` and `ops` group. The `admin` group is allowed to `sudo` without password. Any additional groups should be added here.

### `pillar/iptables`
Any rules for `iptables` should be added to this pillar.

### `pillar/timezone`
This is the timezone for your server. This does not set the system clock, which is set to UTC in 

### `pillar/users`
There is an example `newuser` whose password is `vagrant` and whose public key is the vagrant insecure key. This should be modified to suit your needs and any additional users should be added here.

__Never commit this information to a public repository__

### `pillar/vim`
Defines the location of the `vimrc` file.


