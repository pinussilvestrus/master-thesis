#!/bin/bash

lacheckOutput=`lacheck thesis.tex | grep -v '^"prelude\.tex"' | grep -v '^"thesis\.tex"' | grep -v '^\*\*'`

if [ -n "$lacheckOutput" ]; then
    echo "$lacheckOutput"
    exit 1
fi

exit 0
