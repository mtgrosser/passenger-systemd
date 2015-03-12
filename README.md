# Running Passenger with systemd

This repo provides systemd unit files for running multiple Rails apps with Phusion Passenger. For detailed instructions check out my blog post:

http://matthias-grosser.de/blog/2015/01/deploying-multiple-rails-apps-with-passenger-standalone-and-systemd/

## File layout

```
/etc/systemd/system/passenger@.service
/usr/local/bin/passenger-reload-app
/etc/tmpfiles.d/passenger.conf
```

## Per-app configuration files

```
/apps/APPNAME/current/config/passenger.env
```

## Controlling your applications

```
# systemctl start passenger@APPNAME
# systemctl stop passenger@APPNAME
# systemctl reload passenger@APPNAME
# systemctl restart passenger@APPNAME

$ passenger-restart-app APPNAME
```

