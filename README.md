# marchandd/term_ssh_wine_portableapps

marchandd/term_ssh_wine_portableapps [Docker:copyright:](https://docs.docker.com/ "Docker") image

## Description

A sandbox container with wine 1.7 ready for settings and some Windows Portable-apps samples easy to install, update and use from Linux or Windows host.

### Goal

Based from term_ssh_root_wine image:  
Easy method to produce a GUI containers to access to Wine and able to download apps with Firefox into sandbox from secured host to remote client with SSH.
Image can run Windows software through emulator accessing by view remotely X displays.

After image and container builds, connect to container with GUI SSH client.  
Run scripts for Windows Portable-apps samples to install and use like explain in [docs](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/summary.md "Summary").

### Image size

Around 1400 Mb.

### References

[Marchand D. Maintainer](https://github.com/marchandd/ "Maintainer")

[Details source](https://github.com/marchandd/term_ssh_wine_portableapps/ "Details")

[Image parent](https://github.com/marchandd/term_ssh_root_wine/ "Parent")

[Part of project studies](https://github.com/marchandd/docker_index/ "References")

## Build image

### Command line

:computer: `docker pull marchandd/term_ssh_wine_portableapps > build.log`

### Command line explanation

All details on [docs](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/summary.md "Summary").

3 methods to find password:

- Search password value into build.log file from marchandd/term_ssh_wine_portableapps image to access later to container.

- If you don't have build image with log file redirection, use this comand:  
:computer: `docker inspect IMAGEID`

- If you don't have password value, enter directly into container to find log inside with [Nsenter](http://itsagooddaytobegeek.com/docker-ep-02-installation-de-nsenter/ "Nsenter")

### Firewall

:warning: If your Firewall is enabled on the host, with default outgoing policy turned to 
deny, 
you will have to disable 22 port filtering:  
- Make a new rule for OpenSSH (22/TCP) to enable outgoing policy.

## Build container

### Command line

:computer: `docker run -d -p XXX.XXX.XXX.XXX:YYYYY:22 marchandd/term_ssh_wine_portableapps`

Where XXX.XXX.XXX.XXX is your IP v4 address.  
Where YYYYY is your Private port, if you doesn't know free port, try from 49200...

### Command line explanation

All details on [docs](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/summary.md "Summary").

## Container usage

### Alias

All details on [docs](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/summary.md "Summary").

## Explanations

### Dockerfile

All details on [docs](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/summary.md "Summary").

### Display

Make sure to have installed OpenSSH client or GUI SSH client (Putty).
Wine is installed but need to be initialized before using it.  
All Windows Portable-apps samples must been installed with deployed scripts.

All details on [docs](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/summary.md "Summary").

### Risks

Root account from container is exposed.  
A password is used and not a certificate that could be more secure.
