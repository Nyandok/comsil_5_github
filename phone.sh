if [ $# -eq 0 ]; then
	echo "phone: Error: No argument were given"
	echo "Usage: phone query [...query]"
	
	exit 1
fi

result="__INIT__"

for arg in $@
do
	test=$(egrep -i "$result|$arg" mydata)

	if [ ! -z "$test" ]; then
		result=$test
	fi
done	

egrep -i "$result" mydata | awk -f display.awk
