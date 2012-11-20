perlbrew-helper-scripts
=======================

switch_perlbrew.bashrc
----------------------

This script provide an easier way to switch perlbrew libraries with some customized environment variables.

Please change content of the script for your needs.

Usage example:

```
perlbrew install perl-5.16.2
perlbrew lib create bioperl
cp switch_perlbrew.bashrc ~/.switch_perlbrew.bashrc
source ~/.switch_perlbrew.bashrc perl-5.16.2@bioperl
```
