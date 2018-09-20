# Ansible Role gitlab
This role installs and configures a gitlab server.

# BUGS
There seems to be a bug in gitlab atm where `gitlab-ctl reconfigure` fails. This is bad, because without the first `gitlab-ctl` reconfigure run, no `gitlab-psql` Linux user exists and we cant apply the fix in a task. Hence, run the command yourself and then manually do the fix:
```
root@xenial:~# gitlab-ctl reconfigure
[...]
Running handlers:
There was an error running gitlab-ctl reconfigure:

execute[/opt/gitlab/embedded/bin/initdb -D /var/opt/gitlab/postgresql/data -E UTF8] (postgresql::enable line 80) had an error: Mixlib::ShellOut::ShellCommandFailed: Expected process to exit with [0], but received '1'
---- Begin output of /opt/gitlab/embedded/bin/initdb -D /var/opt/gitlab/postgresql/data -E UTF8 ----
STDOUT: The files belonging to this database system will be owned by user "gitlab-psql".
This user must also own the server process.
STDERR: initdb: invalid locale settings; check LANG and LC_* environment variables
---- End output of /opt/gitlab/embedded/bin/initdb -D /var/opt/gitlab/postgresql/data -E UTF8 ----
Ran /opt/gitlab/embedded/bin/initdb -D /var/opt/gitlab/postgresql/data -E UTF8 returned 1


root@xenial:~# su -l gitlab-psql --shell=/bin/bash
gitlab-psql@xenial:~$ /opt/gitlab/embedded/bin/initdb -D /var/opt/gitlab/postgresql/data -E UTF8
```

NOTE: this is why the tests fail atm.

# TODO
- resetting the admin password should be automated, preferably in a script
- add a molecule test that curls the login page | grep login
- add LDAP for users

# Example play
An example play can be found in `molecule/install/playbook.yml`

# Requirements
You need to setup ssl / letsencrypt certificates so gitlab can use them.

# Maintenance
- update the nginx ssl ciphers in `defaults/main.yml` using the mozilla ssl config generator

# License
Apache-2.0

# License
Apache-2.0

# Author Information
Service and support for orchestrated hosting environments,
continuous integration/deployment/delivery and various Linux
and open-source technology stacks are available from:

```
Blunix GmbH - Consulting for Linux Hosting 24/7
Glogauer Straße 21
10999 Berlin - Germany

Web: www.blunix.org
Email: service[at]blunix.org
Phone: (+49) 30 / 12 08 39 90
```
