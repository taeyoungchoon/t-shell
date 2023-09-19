#!/usr/bin/env bash
# t_sec_package.sh: security package update helper
# ref: redhat-security.org

severities=(Critical Important Moderate Low)

request=$1
option=$2
[[ -n $request ]] && echo request: $request
[[ -n $option ]] && echo option: $option

if [[ $request =~ 'info' ]]; then
    cli='yum updateinfo list updates --sec-severity='
elif [[ $request =~ 'without_kernel' ]]; then
    cli='yum updateinfo list updates --exclude=kernel* --sec-severity='
elif [[ $request =~ 'update' ]]; then
    cli='yum update --exclude=kernel* --security --sec-severity='
elif [[ $request =~ 'download' ]]; then
    cli='yum update --exclude=kernel* --downloadonly --downloaddir=. --sec-severity='
else
    cli='yum updateinfo list updates --sec-severity='
fi

for severity in "${severities[@]}"; do
    printf -v cmd_string "%s%s" "$cli" "$severity"
    if [[ $option =~ 'eval' ]]; then
	echo ------------------------------------------------------------------------
	echo $cmd_string
	echo ------------------------------------------------------------------------
	eval $cmd_string
    elif [[ $option =~ 'echo' ]]; then
	echo $cmd_string
    else
	echo $cmd_string
    fi
done
