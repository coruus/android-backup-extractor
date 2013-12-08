#!/bin/sh

java="$(which java)"
"${java}" -version || java="$(/usr/libexec/java_home)/bin/java"
test '-h bcprov.jar' || ./getbouncycastle.sh
bouncycastle=$(find lib -iname "bcprov*jar" | head -1 | tr -d '\n')
codepath=:bin:${bouncycastle}

"${java}" -cp ${codepath} org.nick.abe.Main $*

