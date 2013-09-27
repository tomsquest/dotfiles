# Wrapper around mvn
# Colorizes the ouput using sed
# Keeps the exit code of mvn and returns it to allow chaining of commands
mvn-in-colors() {

  # Formatting constants
  local color_red=$(tput bold)$(tput setaf 1)
  local color_green=$(tput bold)$(tput setaf 2)
  local color_yellow=$(tput bold)$(tput setaf 3)
  local color_white=$(tput bold)$(tput setaf 7)
  local color_reset=$(tput sgr0)

  # Make sure formatting is reset
  echo -ne ${color_reset}

  # TMP file to store the exit code of the mvn command
  tmp_file=$(mktemp)

  # Filter mvn output using sed
  (command mvn $@ ; echo $? > $tmp_file) | sed \
    -e "s/\(.*-\{55\}\+$\|.*\[INFO\] Scanning for projects.*\|.*\[INFO\] Building.*\|^Running .*\|^ T E S T S$\|^Results.*\)/${color_white}\1${color_reset}/g" \
    -e "s/\(.*\[INFO\] BUILD SUCCESS$\|^Tests run:.*Failures: 0.*Errors: 0.*Skipped: 0.*\)/${color_green}\1${color_reset}/g" \
    -e "s/\(.*\[WARNING].*\|^NOTE: Maven is executing in offline mode\.\|^Tests run:.*Failures: 0, Errors: 0, Skipped: [^0].*\)/${color_yellow}\1${color_reset}/g" \
    -e "s/\(.*\[INFO\] BUILD FAILURE\|.* <<< FAILURE!$\|.* <<< ERROR!$\|^Tests in error:.*\|^Tests run:.*Failures: [^0].*\|^Tests run:.*Errors: [^0].*\)/${color_red}\1${color_reset}/g"

  # Make sure formatting is reset
  echo -ne ${color_reset}

  # Return the exit code of the mvn command
  read mvn_exit_code < $tmp_file
  \rm -f $tmp_file

  return $mvn_exit_code
}
