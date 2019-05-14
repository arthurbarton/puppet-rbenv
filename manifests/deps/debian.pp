# == Class: rbenv::deps::debian
#
# This module manages rbenv dependencies for Debian $::osfamily.
#
class rbenv::deps::debian {
  $default_packages = $::lsbdistcodename ? {
    'xenial'    => [ 'libgdbm3', 'libssl-dev' ],
    'jessie'    => [ 'libgdbm3', 'libssl-dev' ],
    'stretch'   => [ 'libgdbm3', 'libssl-dev' ],
    'buster'    => [ 'libgdbm3', 'libssl-dev' ],
    'disco'     => [ 'libgdbm6', 'libssl-dev' ],
    'eoan'      => [ 'libgdbm6', 'libssl-dev' ],
    default     => [ 'libgdbm5', 'libssl1.0-dev'],
  }

  ensure_packages([
    'build-essential',
    'git',
    'libreadline-dev',
    'zlib1g-dev',
    'libffi-dev',
    'libyaml-dev',
    'libncurses5-dev',
    'libgdbm-dev',
    'patch',
    $default_packages
    ])
}
