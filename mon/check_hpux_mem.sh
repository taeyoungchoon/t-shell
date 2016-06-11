#!/bin/sh


############################## check_hpux_mem #########################
# Version : 1.1
# Date :  April 24 2012
# Author  : Thibaut Ploquin, d'après le script de
# 		Alain van der Heiden & Remco Hage "check_snmp_hpux_mem"	
#######################################################################
#
# help : ./check_hpux_mem

PROGNAME=$0
HOSTNAME="$1"
WARNING=$2
CRITICAL=$3
COMMUNITY=$4

print_help() {
	echo $PROGNAME
	echo ""
	echo "Usage: $PROGNAME <hostname> <warning> <critical> <SNMPCommunity>"
	echo ""
	echo "This plugin checks the total and used memory on HP-UX servers."
	echo "Tests if used memory is greater than <warning> and <critical>"
	echo "Can create graphs"
	echo ""
	exit 0
}


case "$1" in
	--help)
		print_help
		exit 0
		;;
	-h)
		print_help
		exit 0
		;;
	--version)
   		echo $PROGNAME v0.1
		exit 0
		;;
	-V)
		echo $PROGNAME v0.1
		exit 0
		;;
	*)
		FREEKB=`snmpwalk -v 2c -c $COMMUNITY "$HOSTNAME" -Oq -Ov .1.3.6.1.4.1.11.2.3.1.1.7.0` #Free Memory in KB
		TOTALKB=`snmpwalk -v 2c -c $COMMUNITY "$HOSTNAME" -Oq -Ov .1.3.6.1.4.1.11.2.3.1.1.8.0` #Total Memory in KB
		USEDKB=$(echo "scale=0 ; $TOTALKB-$FREEKB"| bc) #Used Memory in KB
		TOTALG=$(echo "scale=0 ; $TOTALKB*1024"| bc) #Total for graph in Byte
                USEDG=$(echo "scale=0 ; $USEDKB*1024"| bc) #Used for graph in Byte


	#### Conversion TOTALMEM KB -> MB -> GB ####

		TESTTOT=$(echo "scale=0 ; $TOTALKB/1024"| bc)
		if [ $TESTTOT -ge 1 ]; then
			UTOT=$(echo " MB")
			TOTALMEMINT=$(echo "scale=0 ; $TOTALKB/1024"| bc)
			TOTALMEM=$(echo "scale=4 ; $TOTALKB/1024"| bc)
			TESTTOT=$(echo "scale=0 ; $TOTALMEMINT/1024"| bc)
			if [ $TESTTOT -ge 1 ]; then
				UTOT=$(echo " GB")
		                TOTALMEM=$(echo "scale=4 ; $TOTALMEM/1024"| bc)
			fi
		else
			TOTALMEM=$(echo "scale=0 ; $TOTALKB")
			UTOT=$(echo " MB")
		fi


	#### Conversion USEDMEM KB -> MB -> GB  ####

                TESTUSE=$(echo "scale=0 ; $USEDKB/1024"| bc)
                if [ $TESTUSE -ge 1 ]; then
			UUSE=$(echo " MB")
                        USEDMEMINT=$(echo "scale=0 ; $USEDKB/1024"| bc)
                        USEDMEM=$(echo "scale=4 ; $USEDKB/1024"| bc)
                        TESTUSE=$(echo "scale=0 ; $USEDMEMINT/1024"| bc)
                        if [ $TESTUSE -ge 1 ]; then
				UUSE=$(echo " GB")
                                USEDMEM=$(echo "scale=4 ; $USEDMEM/1024"| bc)
              		fi
                else
                        USEDMEM=$(echo "scale=0 ; $USEDKB")
                        UUSE=$(echo " MB")
		fi


	#### Percentage calculation ####

		CALDEPTH=$(echo "scale=0 ; $USEDKB*100"| bc)
		PERCENT=$(echo "scale=2 ; $CALDEPTH/$TOTALKB"| bc)
		INTPERCENT=$(echo "scale=0 ; $CALDEPTH/$TOTALKB"| bc)
		

	#### Affichage ####

		echo "Mem: $USEDMEM $UUSE / $TOTALMEM $UTOT ($PERCENT%)|used=${USEDG}B size=${TOTALG}B"


	#### TEST if Critical or Warning ####

		if [ $CRITICAL -le $INTPERCENT ]; then
			echo "CRITICAL"
			exit 2
		elif [ $WARNING -le $INTPERCENT ]; then
			echo "WARNING"
			exit 1
		else
			echo "OK"
			exit 0
		fi
		;;
esac
