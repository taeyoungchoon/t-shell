#!/usr/bin/env bash
# filename : loop.sh

if [[ $# -eq 0 ]]; then
    echo "usage : $0 command [gap]"
    exit 1
fi

v_cmd=$1
echo $v_cmd;
if [[ -n $2 ]] && [[ $2 -gt 0 ]]; then
    v_gap=$2;
else
    :
fi

# todo : COLUMNS, stty, tput cols
# printf 'x%.s' {1..30}
function f_header () {
    echo "- start --"
}

function f_footer () {
    echo "- end ----"
    echo ""
}

trap "echo fine, thanks for using; exit" INT

while true; do
    f_header;
    ${v_cmd};
    f_footer;
    sleep ${v_gap:-3};
done
