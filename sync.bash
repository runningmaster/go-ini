#!/bin/bash -e

. vars.inc

go_get_and_install() {
	while read pkg
	do
		[[ "$pkg" =~ ^#.*$ ]] && continue
		if [ "$pkg" != '' ];
		then
			echo "$pkg"
			go get -d $pkg
			pkgdir=$(echo "/$pkg" | cut -d "/" -f2)
			rm -rf $GOPATH/src/vendor/$pkg
			mkdir -p $GOPATH/src/vendor/$pkgdir 
			cp -rf $GOPATH/src/$pkgdir $GOPATH/src/vendor/
			rm -rf $GOPATH/src/$pkgdir
			#go install $pkg
		fi
	done < ./DEPENDENCIES

        for i in ".hg*" ".git*" ".bzr*" ".svn"
        do
		find $GOPATH/src/vendor -name "$i" -print0 | xargs -0 rm -rf
        done

	#go install main
	echo "OK (get/install)"
}

echo ""
confirm "Update external packages?" && go_get_and_install
