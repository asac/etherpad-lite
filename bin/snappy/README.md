# etherpad-lite for snappy Ubuntu

etherpad-lite for snappy Ubuntu Core

## BUILD with snapcraft 1.x

To build a .snap for snappy Ubuntu Core 15.04 use snapcraft from 1.x branch and
run:

```
  $ snapcraft all
```

*IMPORTANT for 15.04*: Before uploading to store you have to manually set a
version in snapcraft.yaml. The version needs to be higher than the previous
versions to get accepted.

## BUILD with snapcraft 2.x (master)

To build a .snap for snappy Ubuntu Core 16.04 use snapcraft from master branch and
run:

```
  $ snapcraft snap
```

## TODO
* snappy config support
* configure etherpad-lite plugins to include in snapcraft.yaml


