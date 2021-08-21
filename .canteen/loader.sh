#!/usr/bin/env bash
ProductDependentPath="$( cd "$( dirname $0 )" && pwd )"
DEPENDENT=""
for filename in $ProductDependentPath/lib/*.sh; do
    chmod +x $filename
    DEPENDENT="${DEPENDENT}source \"$filename\"; "
done

DEPENDENT="${DEPENDENT}$(cat "$1/canteen.sh")"
cd $1
echo "$DEPENDENT" | bash -E -