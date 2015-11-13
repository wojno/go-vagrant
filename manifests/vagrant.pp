$HOME       = '/home/vagrant'
$TMP        = '/home/vagrant/tmp'
$GO_VERSION = '1.5.1.linux-amd64'
$WORKSPACE  = "$HOME/workspace"

include stdlib

package {
  'curl' : ensure => 'latest';
  'git'  : ensure => 'latest';
}

file_line { '/etc/hostname':
  path    => '/etc/hostname',
  match   => 'vagrant-ubuntu-precise-64',
  line    => 'go',
  replace => true
}

file_line { '/etc/hosts':
  path    => '/etc/hosts',
  match   => '127.0.0.1 vagrant-ubuntu-precise-64',
  line    => '127.0.0.1 go',
  replace => true
}->
exec { 'hostname start':
  command => '/etc/init.d/hostname start',
}

exec { 'create tmp':
  command => "mkdir $TMP",
  creates => $TMP,
  user    => 'vagrant',
  path    => '/bin'
}->
exec { 'download-go1.5.1':
  command => "curl -O https://storage.googleapis.com/golang/go$GO_VERSION.tar.gz",
  cwd     => $TMP,
  path    => '/usr/bin',
  user    => 'vagrant',
  creates => "$TMP/go$GO_VERSION.tar.gz"
}->
exec { 'extract go':
  command => "tar -C /usr/local -xzf go$GO_VERSION.tar.gz",
  cwd     => $TMP,
  path    => '/bin',
  creates => '/usr/local/go'
}->
exec { 'create workspace':
  command => "mkdir $WORKSPACE",
  creates => $WORKSPACE,
  user    => 'vagrant',
  path    => '/bin'
}->
file_line { 'gopath':
  path => "$HOME/.profile",
  line => "export GOPATH=$HOME/workspace"
}->
file_line { 'go path':
  path => "$HOME/.profile",
  line => 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin'
}->
exec { 'create directory structure':
  command => "mkdir -p $WORKSPACE/src/github.com/user/ $WORKSPACE/bin $WORKSPACE/pkg",
  creates => "$WORKSPACE/github.com/user/",
  user    => 'vagrant',
  path    => '/bin'
}
