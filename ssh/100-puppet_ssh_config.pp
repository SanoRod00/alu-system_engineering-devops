# Task 100 - Client configuration file (with Puppet)
# Configure the SSH client so that it:
#   - uses the private key ~/.ssh/school
#   - refuses password authentication
# Uses the file_line resource type from the puppetlabs-stdlib module.

file_line { 'Turn off passwd auth':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '    PasswordAuthentication no',
}

file_line { 'Declare identity file':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '    IdentityFile ~/.ssh/school',
}
