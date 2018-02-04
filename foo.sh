for line in $(cat foo.sh)
do
    echo $line
done

if [[ -e foo.sh ]]
then
    echo "exist"
fi

arg=$1
case $arg in
    "love")
	echo love is
	exit 1
	;;
    "hate")
	echo hate then
	exit 2
	;;
    *)
	echo way out
	exit 3
	;;
esac
