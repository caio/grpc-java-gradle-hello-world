#!/usr/bin/env bash

set -e

OLD_PACKAGE="io.github.caio.grpc";
NEW_PACKAGE=$1
SED=${SED:=sed}

if [ -z $1 ]; then
    echo "Usage: $0 <new-package>" 1>&2
    exit 1
fi

git grep -l $OLD_PACKAGE| xargs $SED -i "s/${OLD_PACKAGE}/${NEW_PACKAGE}/g"

OLD_DIR_STRUCTURE=${OLD_PACKAGE//.//}
NEW_DIR_STRUCTURE=${NEW_PACKAGE//.//}

echo $DIR_STRUCTURE

for basedir in src/main/java src/generated/main/*; do
    mkdir -p ${basedir}/${NEW_DIR_STRUCTURE}
    mv ${basedir}/${OLD_DIR_STRUCTURE}/* ${basedir}/${NEW_DIR_STRUCTURE}/
    rm -rf ${basedir}/io
done

echo "Done!";
