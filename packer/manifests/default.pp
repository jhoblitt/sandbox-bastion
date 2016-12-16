hiera_include('classes')

if $::osfamily == 'RedHat' {
  if $::operatingsystem != 'Fedora' {
    include ::epel
    Class['epel'] -> Package<| provider != 'rpm' |>
  }

  # kludge around yum-cron install failing without latest yum package:
  # https://bugzilla.redhat.com/show_bug.cgi?id=1293713
  package { 'yum': ensure => latest } -> Package['yum-cron']
  # note:
  #   * el6.x will update everything
  class { '::yum_autoupdate':
    exclude      => ['kernel*'],
    notify_email => false,
    action       => 'apply',
    update_cmd   => 'security',
  }

  # disable postfix on el6/el7 as we don't need an mta
  service { 'postfix':
    ensure => 'stopped',
    enable => false,
  }
}

$packages = hiera('packages', undef)

if ($packages) {
  ensure_packages($packages)
}
