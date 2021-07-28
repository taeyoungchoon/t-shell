#!/usr/bin/env bash

test -x /bin/date && echo t
test -e /bin/ddr && echo t || echo nil

[[ -f /bin/ps ]] && echo t

[ -f /bin/ps ] && echo ever t

[[ -e /bin/ps && -e /bin/mv ]]
