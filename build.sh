#!/usr/bin/env bash
# Helper script to compile and run Haxe apps targeting
# the Mono/.Net platform.
#
# Usage:
#
#     ./build.sh          # will try to compile and run the result
#     ./build.sh norun    # will compile but not run


# If no arguments were specified, then assume we also want to run
if [ -z "$1" ]; then
    RUN=1;
# If norun was passed, we wish to compile only
elif [ $1 == 'norun' ]; then
    RUN=0;
fi;

echo "Compiling...";
COMP_SUCCESS=0;
haxe build.hxml && COMP_SUCCESS=1;

# If compilation failed, go no further (definitely don't try to run!)
if [ 0 == $COMP_SUCCESS ]; then
    echo "- Compilation failed";
    exit
fi;

# Run the resulting executable (makes some assumptions about the
# build.hxml config)
if [ 1 == $RUN ];
    then
        echo "Running...";
        ./build/bin/App.exe;
fi;