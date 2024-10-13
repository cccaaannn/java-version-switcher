#!/bin/bash

# Name:     java version switcher (jvs.sh)
# Purpose:  Switches between java and maven versions for bash/zsh sessions.
# Author:   Can Kurt
# GitHub:   https://github.com/cccaaannn

v_JAVA_VERSION="$1"
v_M2_VERSION="$3"
v_SET_MAVEN_FLAG=0

# --- Functions ---

about() {
    cat <<EOF
Java Version Switcher
   _
  (_)_   _____
  | \ \ / / __|
  | |\ V /\__ \\
 _/ | \_/ |___/
|__/

By: Can Kurt
https://github.com/cccaaannn
EOF
    return 1
}

help() {
    cat <<EOF
--- Java Version Switcher --- 
Switches between java and maven versions for cmd sessions.

- Script setup
   1- In addition to the regular JAVA_HOME environment variable, different java versions have to be set as environment variables for the script to work.
   2- Environment variable naming should follow this standard "JAVA_HOME_<VERSION>". Ex: JAVA_HOME_18
   3- Using the same naming standard, more M2_HOME variables can also be set for maven version switching "M2_HOME_<VERSION>". Ex: M2_HOME_3.6

- Commands
   -h, --help      Prints help message.
   -a, --about     Shows about jvs.
   -m <MAVEN_VERSION>, --maven <MAVEN_VERSION> 
                   Used for switching maven version.

- Usage
   jvs <JAVA_VERSION>
   jvs <JAVA_VERSION> -m <MAVEN_VERSION>

- Examples
   jvs 11
   jvs 1.8 -m 3.6
   jvs 18 --maven 3.8
EOF
    return 1
}

invalid_java_version_provided_error() {
    cat <<EOF
ERROR
Provided java version "$v_JAVA_VERSION" is not set as an environment variable, it must be set as "JAVA_HOME_$v_JAVA_VERSION".
Java version is not changed.
For more info run "jvs -h".
EOF
    return 1
}

invalid_maven_version_provided_error() {
    cat <<EOF
ERROR
Provided maven version "$v_M2_VERSION" is not set as an environment variable, it must be set as "M2_HOME_$v_M2_VERSION".
Java version is not changed.
For more info run "jvs -h".
EOF
    return 1
}

only_maven_version_provided_error() {
    cat <<EOF
ERROR
You must provide a java version.
For more info run "jvs -h".
EOF
    return 1
}

no_java_version_provided_error() {
    cat <<EOF
ERROR
No java version provided.
For more info run "jvs -h".
EOF
    return 1
}

set_java_home() {
    # Set NEW_JAVA_HOME variable
    local v_NEW_JAVA_HOME="JAVA_HOME_${v_JAVA_VERSION}"

    # Parameter expansion done with eval for cross-shell compatibility
    eval "v_NEW_JAVA_HOME=\"\${$v_NEW_JAVA_HOME}\""

    # If environment not exists return error.
    if [ -z "$v_NEW_JAVA_HOME" ]; then
        invalid_java_version_provided_error || return 1
    fi

    # If java version exists proceed
    # Set new JAVA_HOME
    export JAVA_HOME="$v_NEW_JAVA_HOME"
    export PATH="$JAVA_HOME/bin:$PATH"
}

set_maven_home() {
    # Set NEW_M2_HOME variable
    local v_NEW_M2_HOME="M2_HOME_${v_M2_VERSION}"

    # Parameter expansion done with eval for cross-shell compatibility
    eval "v_NEW_M2_HOME=\"\${$v_NEW_M2_HOME}\""

    # If environment not exists return error.
    if [ -z "$v_NEW_M2_HOME" ]; then
        invalid_maven_version_provided_error || return 1
    fi

    # If maven version exists proceed
    # Set new M2_HOME
    export M2_HOME="$v_NEW_M2_HOME"
    export PATH="$M2_HOME/bin:$PATH"
}

# Success condition
success() {
    cat <<EOF
Java version switched by
   _
  (_)_   _____
  | \ \ / / __|
  | |\ V /\__ \\
 _/ | \_/ |___/
|__/

EOF

    # Print java or maven version
    if [ "$v_SET_MAVEN_FLAG" -eq 1 ]; then
        mvn --version
    else
        java -version
    fi
}

# --- Argument parsing ---
if [ "$2" = "-m" ] || [ "$2" = "--maven" ]; then
    if [ -n "$3" ]; then
        v_SET_MAVEN_FLAG=1
    fi
fi

if [ -z "$1" ]; then
    no_java_version_provided_error || return 0
fi

case "$1" in
    -h|--help)
        help || return 0
        ;;
    -a|--about)
        about || return 0
        ;;
    -m|--maven)
        only_maven_version_provided_error || return 0
        ;;
esac


# --- Main script logic ---
if [ -n "$1" ]; then
    set_java_home "$1" || return 0
fi

if [ "$v_SET_MAVEN_FLAG" -eq 1 ]; then
    set_maven_home "$3" || return 0
fi

success || return 0