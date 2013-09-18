#!/bin/bash

# Formatting constants
export BOLD=`tput bold`
export TEXT_BLACK=`tput setaf 0`
export TEXT_RED=`tput setaf 1`
export TEXT_GREEN=`tput setaf 2`
export TEXT_YELLOW=`tput setaf 3`
export TEXT_BLUE=`tput setaf 4`
export TEXT_MAGENTA=`tput setaf 5`
export TEXT_CYAN=`tput setaf 6`
export TEXT_WHITE=`tput setaf 7`
export RESET_FORMATTING=`tput sgr0`

# Wrapper around mvn
# Colorizes the ouput using sed
# Keeps the exit code of mvn and returns it to allow chaining of commands
mvn-in-colors() {

  tmp_file=$(mktemp)

  # Make sure formatting is reset
  echo -ne ${RESET_FORMATTING}

  # Filter mvn output using sed
  #(command cat ~/failure_one.txt $@ ; echo $? > $tmp_file) | sed \
  (command mvn $@ ; echo $? > $tmp_file) | sed \
    -e "s/\(.*------\+$\|.*\[INFO\] Scanning for projects.*\|.*\[INFO\] Building.*\|^Running .*\|^ T E S T S$\|^Results.*\)/${BOLD}${TEXT_WHITE}\1${RESET_FORMATTING}/g" \
    -e "s/\(.*\[INFO\] BUILD SUCCESS\|^Tests run:.*Failures: 0.*Errors: 0.*Skipped: 0.*\)/${BOLD}${TEXT_GREEN}\1${RESET_FORMATTING}/g" \
    -e "s/\(.*WARN.*\|^NOTE: Maven is executing in offline mode\.\|^Tests run:.*Failures: 0.*Errors: 0.*Skipped: [^0].*\)/${BOLD}${TEXT_YELLOW}\1${RESET_FORMATTING}/g" \
    -e "s/\(.*FAILURE.*\|.*ERROR.*\|^Tests in error:.*\|^Tests run:.*Failures: [^0].*\|^Tests run:.*Errors: 1.*\)/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g"

  # read the return code of the mvn command
  read mvn_exit_code < $tmp_file
  \rm -f $tmp_file

  # Make sure formatting is reset
  echo -ne ${RESET_FORMATTING}

  return $mvn_exit_code
}

# Override the mvn command with the colorized one.
alias mvn="mvn-in-colors"
