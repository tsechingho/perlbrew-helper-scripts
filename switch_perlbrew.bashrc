#!/usr/bin/env bash
#
# author: Tse-Ching Ho
# email: tsechingho@gmail.com
# usage:
#
#   source ~/.switch_perlbrew.bashrc perl-5.16.2@bioperl
#

lib=$1
use_only=$2

if [[ $lib == '' ]]; then
  echo "usage: source ~/.switch_perlbrew.bashrc lib_name [--use]"
  return
elif [[ ! `perlbrew list | grep -E ^.{2}$lib$` ]]; then
  echo "Your perlbrew library name is wrong!"
  echo "User one of following:"
  perlbrew list
  return
fi

while IFS='@' read -ra NAME; do
  if [[ ${NAME[0]} == $PERLBREW_PERL && ${NAME[1]} == $PERLBREW_LIB ]]; then
    return
  fi
done <<< $lib

function unset_perl5lib {
  if [[ $PERL5LIB =~ .+ ]]; then
    unset PERL5LIB
    export PERL5LIB=
  fi
}

function perlbrew_switch_and_list {
  if [[ $use_only == '--use' ]]; then
    perlbrew use $lib
    echo "use $lib for a while ..."
  else
    perlbrew switch $lib
    perlbrew list
  fi
}

case $lib in
  'perl-5.16.2@ensembl-65' )
    unset_perl5lib
    export ENSEMBL_ROOT="$PERLBREW_ROOT/libs/$lib"
    export PERL5LIB="$PERL5LIB:$ENSEMBL_ROOT/bioperl-live"
    export PERL5LIB="$PERL5LIB:$ENSEMBL_ROOT/ensembl/modules"
    export PERL5LIB="$PERL5LIB:$ENSEMBL_ROOT/ensembl-variation/modules"
    export PERL5LIB="$PERL5LIB:$ENSEMBL_ROOT/ensembl-compara/modules"
    export PERL5LIB="$PERL5LIB:$ENSEMBL_ROOT/ensembl-functgenomics/modules"
    perlbrew_switch_and_list
    ;;
  'perl-5.16.2@ensembl-69' )
    unset_perl5lib
    export ENSEMBL_ROOT="$PERLBREW_ROOT/libs/$lib"
    export PERL5LIB="$PERL5LIB:$ENSEMBL_ROOT/bioperl-live"
    export PERL5LIB="$PERL5LIB:$ENSEMBL_ROOT/ensembl/modules"
    export PERL5LIB="$PERL5LIB:$ENSEMBL_ROOT/ensembl-variation/modules"
    export PERL5LIB="$PERL5LIB:$ENSEMBL_ROOT/ensembl-compara/modules"
    export PERL5LIB="$PERL5LIB:$ENSEMBL_ROOT/ensembl-functgenomics/modules"
    perlbrew_switch_and_list
    ;;
  * )
    unset_perl5lib
    perlbrew_switch_and_list
    ;;
esac
