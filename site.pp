include 'stdlib'
#include 'chocolatey'

$homepath="$env_home"
$appdatapath="$env_appdata"
$dbpath="$homepath/Dropbox"
$wapath="$dbpath/Windows_Automation"
$secretspath="$dbpath/Windows_Automation_Secrets"
$cmd='C:\Windows\System32\cmd.exe'

Exec {
  logoutput => true,
}

File {
  source_permissions => ignore,
}

# Seems to have been fixed
# 
# # Without this, gem install doesn't work
# file { "$rubysitedir/rubygems/ssl_certs/AddTrustExternalCARoot-2048.pem":
#   source => "$wapath/extras/AddTrustExternalCARoot-2048.pem",
# }

class everything {
  include 'misc'
  include 'windows_extras'
  include 'conemu'
  include 'firefox'
  include 'pdfxchange'
  include 'secrets'
  include 'pictures'
  include '7zip'
  # We handle this manually so we can copy the content over
  # include 'path_of_exile'
}

# Laptops
node 'rlp-laptop' {
  $laptop=true
  $deskop=false

  include everything
}

# Desktops
node 'rlp-desktop' {
  $laptop=false
  $desktop=true

  include everything
}

