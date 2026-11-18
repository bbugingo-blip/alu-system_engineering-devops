# Raises the Nginx open file limit so it handles load without failed requests
exec { 'fix--for-nginx':
  command => 'sed -i s/15/4096/ /etc/default/nginx',
  path    => '/bin:/usr/bin',
  notify  => Exec['restart-nginx'],
}

exec { 'restart-nginx':
  command     => 'service nginx restart',
  path        => '/usr/sbin:/usr/bin:/sbin:/bin',
  refreshonly => true,
}
