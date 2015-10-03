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
