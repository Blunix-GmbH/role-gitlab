# Ansible Role gitlab
This role installs and configures a gitlab server.

# TODO
- add a molecule test that curls the login page | grep login
- add a test for admin login
- add LDAP for users

# Example play
An example play can be found in `molecule/install/playbook.yml`

# Requirements
You need to setup ssl / letsencrypt certificates so gitlab can use them.

# Maintenance
- update the nginx ssl ciphers in `defaults/main.yml` using the mozilla ssl config generator

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
