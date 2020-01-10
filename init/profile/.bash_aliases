alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias www='cd /var/www'

# set env
function setenv() {
  if [ -z "$1" ]; then
    echo "App name not provided"
    return 1
  fi

  FILE=/home/pi/secure/app/$1/.env
  if [ ! -f "$FILE" ]; then
    echo ".env file not present: $FILE"
    return 1
  fi

  VALID_EXPORT_REGEX='^\s*[^#=].*'
  while read -u 10 -r line; do
    if [[ "$line" =~ $VALID_EXPORT_REGEX ]]; then
      eval "export $line"
    fi
  done 10<$FILE
}
function unsetenv() {
  if [ -z "$1" ]; then
    echo "App name not provided"
    return 1
  fi

  FILE=/home/pi/secure/app/$1/.env
  if [ ! -f "$FILE" ]; then
    echo ".env file not present: $FILE"
    return 1
  fi

  unset $(grep -v '^\s*#' "$FILE" | sed -E 's/(.*)=.*/\1/' | xargs)
}

# jails
function jails() {
    sudo fail2ban-client status $1
}

# RPI
alias measure_temp='/opt/vc/bin/vcgencmd measure_temp'
alias memory='free -h'