perlbrew-helper-scripts
=======================

switch_perlbrew.bashrc
----------------------

This script provide an easier way to switch perlbrew libraries with some customized environment variables.

Please change content of the script for your needs.

Usage example:

```
perlbrew install perl-5.16.2
cp switch_perlbrew.bashrc ~/.switch_perlbrew.bashrc
echo "source ~/.switch_perlbrew.bashrc perl-5.16.2" >> ~/.profile

perlbrew lib create bioperl
source ~/.switch_perlbrew.bashrc perl-5.16.2@bioperl

source ~/.switch_perlbrew.bashrc perl-5.16.2 --use

echo "alias perls="source ~/.switch_perlbrew.bashrc"" >> ~/.profile
```

License
-------

MIT
