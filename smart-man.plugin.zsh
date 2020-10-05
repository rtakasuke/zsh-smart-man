function man {
    local code

    # /usr/bin/man ARGS
    /usr/bin/man "$@" > /dev/null 2>&1; code="$?"
    if [ "$code" -eq 0 ]; then
        /usr/bin/man "$@"
        return 0
    fi

    # ARGS --help
    "$@" --help > /dev/null 2>&1; code="$?"
    if [ "$code" -eq 0 ]; then
        "$@" --help
        return 0
    fi

    # ARGS -h
    "$@" -h > /dev/null 2>&1; code="$?"
    if [ "$code" -eq 0 ]; then
        "$@" -h
        return 0
    fi

    # usage
    if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
        /usr/bin/man --help
        return 0
    fi

    echo "No manual entry for $*"
    return 1
}
