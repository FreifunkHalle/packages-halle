# shlib-webif.sh - web interface helper functions
# $Id: shlib-webif.sh 1522 2008-02-10 08:20:41Z jow $

# webif_shellescape 'string'
# Mask all unsafe characters in supplied string with backslashes.
webif_shellescape() {
	echo "$1" |\
		sed -ne '
			s/\([   \\ "`<>\|;()\?#\$^&*=\[]\)/\\\1/g
			s/]/\\]/g
			s/'"'/\\\\'"'/g
			p
		' 
}

# webif_parse_keyval /path/to/file [ "prefix" ]
# webif_parse_keyval "key1=val1\nkey2=val2\n...\nkeyN=valN" [ "prefix" ]
# Read a key=value formatted string (or file) and evaluate it's contents in a safe way.
# If an optional prefix is given as second argument it will be prepended to each variable name.
webif_parse_keyval() {
	data="$1"
	prefix="$2"

	if [ -f "$data" ]; then
		data="$(cat "$data")"
	fi

	eval $(
		echo "$data" | while read line; do
                	name=$(webif_shellescape "$(echo "$line" | sed -ne's/^\([a-zA-Z_][a-zA-Z0-9_]*\)[         ]*=.*$/\1/p')")
	                data=$(webif_shellescape "$(echo "$line" | sed -e's/^[^=]\+=[     ]*//')")

                	if [ -n "$name" ]; then echo $prefix$name=$data; fi
		done
	);
}

# webif_parse_urlquery [ "prefix" ]
# Read the contents of QUERY_STRING and parse them.
# If an optional prefix is given as first argument it will be prepended to each variable name.
webif_parse_urlquery() {
	if [ -n "$REQUEST_METHOD" -a "$REQUEST_METHOD" = "POST" ]; then
		read QUERY_STRING
	fi

	prefix="$1"; skip=0; key=""
	for item in $(echo "$QUERY_STRING" | sed -e'y/&/ /'); do

		# key has no value, skip
		[ -n "${item#*=}" -a -n "${item%=*}" -a -z "${item%%*=*}" ] || continue

		for item in $(echo "$item" | sed -e'y/=/ /'); do

			# skip this cycle?
			[ "$skip" = 1 ] && skip=0 && continue

			# is a key
			if [ ${#key} = 0 ]; then
				# get clean part (only A-Z, a-z, 0-9 and _) from item ...
				item="${item%%[^a-zA-Z0-9_]*}"

				# ... then assure that key has valid chars and doesn't start with digit
				if [ -n "$item" -a -z "${item%%[^0-9]*}" ]; then
					key=$item

				# invalid key, skip next cycle
				else
					skip=1
				fi

			# is a value
			else
				# has length?
				[ -n "$item" ] && eval "$prefix$key=$(webif_shellescape "$(httpd -d "$item")")"

				key=""
			fi
		done
  done
}

# webif_urldecode 'string'
# Perform url decoding on given string.
webif_urldecode() {
	httpd -d "$1"
}

# webif_get_htmlpath_to_ip "$REMOTE_ADDR"
# Return full https:// url for $REMOTE_ADDR if not originating from lan subnet, otherwise
# just return a relative path (./) .
webif_get_htmlpath_to_ip() {
	. /usr/share/shlib.sh interface
	
	localip=$(interface_get_localip $1)
	if [ -n "$(pidof xrelayd)" -a "$localip" != "$(nvram get lan_ipaddr)" -a "$1" != "127.0.0.1" ]; then 
		if [ -n "$srvip" ]; then echo "https://$localip/"
		else echo "https://$(interface_to_ip $(interface_get_wifidev))/"
		fi
	else echo './'
	fi
}

# webif_firstuppercase <string>
# Return given string with first letter converted to uppercase.
webif_firstuppercase() {
	echo $1 | sed 'h;s/\([a-zA-Z]\).*/\1/;y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/;G;s/\n[^a-zA-Z]*.//'
}

# webif_alluppercase <string>
# Return given string with all letters converted to uppercase.
webif_alluppercase() {
	echo $1 | sed 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/'
}

# webif_gentabs '<tab_1=Tab1-Name>[;tab2=Tab2-Name;tab3=Tab3-Name;tabN=TabN-Name]' [ '#' ]
# Generate css formatted tabs containing hyperlinks with given "tabN" appended to
# the link's query-string as "?display=tabN". When '#' is provided as second argument this
# function creates anchors instead of links with query-strings.
webif_gentabs() {
	zindex=10; IFS=\;
	for tab in $1; do
		[ -z "$tab" ] && continue
		tab_name="${tab#*=}"
		if [ "$display" = "${tab%=*}" ]; then zindex=11; tab_class='tab_sel tab'; else tab_class='tab'; fi
		echo "<a href='${2:-?display=}${tab%=*}' class='$tab_class' style='z-index:${zindex};' title='${tab_name#*|}'>${tab_name%|*}</a>"
		let zindex=$zindex-1
	done
	echo "<br class='tab' />"
	unset IFS
}

# webif_progressbar <timeout> <redirect-address>
# Return html-code with progressbar and javascript code triggering a refresh after
# specified "timeout" given in seconds. The javascript will redirect to given
# "redirect-address". Available timeouts are 51, 136, 170 and 300 seconds.
webif_progressbar() {
	. /usr/share/shlib.sh interface
	
	cat<<EOF	
<IMG ALT="${1:-300}s..." HEIGHT="8" SRC="../images/progress${1:-300}.gif?$(date +%Y%m%d%H%M%S)" VSPACE="10" WIDTH="255" TITLE="${1:-300}s...">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript"><!--
setTimeout("location.href=('192.168.1.1'==location.hostname?'http://${2:-$(interface_get_localip $REMOTE_ADDR)}/':'/')", ${1:-300}000);
//--></SCRIPT>
EOF
}

# webif_masqmac()
# Masqerade everything that looks like a mac address in piped input stream.
# This function is intended to be used as a stdin/stdout filter.
webif_masqmac() {
	sed 's/\([a-fA-F0-9:]\{5\}\):[a-fA-F0-9:]\{5\}:\([a-fA-F0-9:]\{5\}\)/\1:XX:XX:\2/g'
}

# webif_sed_sort <field#> [<separator>]
# Numerically sort the piped input after the column specified by "field#".
# Use given "seperator" as column seperator. If "seperator" is ommited then "," is choosen as default.
# This function is intended to be used as a stdin/stdout filter.
webif_sed_sort() {
	S="${2:-,}"
	F="${1:-1}"
	sed -e "s/$/$S/g;s/^\(\([^$S]*$S\)\{$(($F-1))\}\)\([^$S]*$S\)\(.*\)$/\3\1\4/g" |\
	sort -n |\
	sed -e "s/^\([^$S]*$S\)\(\([^$S]*$S\)\{$(($F-1))\}\)\(.*\)$/\2\1\4/g;s/$S$//g"
}

# webif_sed_reverse()
# Reverse the order of lines from piped input.
# This function is intended to be used as a stdoin/stdout filter.
webif_sed_reverse() {
	sed -ne '1!G;h;$p'
}
