#! /bin/bash -e
# https://scottlinux.com/2014/08/05/add-tack-e-x-on-your-bash-shebang-binbash-ex/

java $JAVA_OPTS -jar /usr/share/youtrack/youtrack-${YOUTRACK_VERSION}.jar 8080${1}
