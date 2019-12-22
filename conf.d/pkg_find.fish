function pkg_find

	set -l index /tmp/.pkg.index.html
	set -l remote_dir https://ftp.fau.de/pub/OpenBSD/(uname -r)/packages/(uname -m)/

	echo $remote_dir
	if not test -r $index
		echo "Index file too old. Updating ..."
		ftp -o $index -VM $remote_dir
	end

	if test (find $index -mtime +2)
		echo "Index file too old. Updating ..."
		ftp -o $index -VM $remote_dir
	end

	for pkg in $argv
		echo "Packages matching your query $pkg"
		grep -i $pkg $index | awk -F\" '{print $6}' | sed 's/.tgz$//g'
	end
end
