#if parted /dev/sdc print | grep "unrecognised disk label"; then
#	echo labeling first
#	exit 1
#fi

function msg ()
{
	echo ==================================
	echo $*
	echo ==================================
}

msg hello, world
