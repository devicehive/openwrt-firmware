#!/bin/bash

if [[ $EUID -eq 0 ]]; then
	echo "ERROR! Do not call it with SU!"
	exit
fi

# exit on error
set -e

# dir with this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# downloading source
cd $DIR
if [ -e "trunk/DA.MARK" ]; then
	cd trunk
	make clean
	make -j 8
else
	rm -rf trunk
	svn co svn://svn.openwrt.org/openwrt/trunk/ #-r {2015-01-19}
	cd trunk
	# adding alljoyn repo
	echo "src-git alljoyn https://git.allseenalliance.org/gerrit/core/openwrt_feed;attitude_adjustment" >> feeds.conf.default
	# adding DA package
	cp -r $DIR/files/alljoynblegw ./package/
	cp -r $DIR/files/alljoyngw ./package/
	cp -r $DIR/files/blegw ./package/
	cp -r $DIR/files/bluepy-helper ./package/
	# donwnloading all packages
	./scripts/feeds update -a
	./scripts/feeds install -a
	# freeze packages version
	#(cd ./feeds/packages && git checkout `git rev-list -n 1 --before="2015-01-19 12:00" master`)
	# fix image header for D-LINK-DIR505
	patch -p0 < $DIR/files/trunc_header_fix_D-LINK-DIR505A_to_LA.patch
	# adding gatttoll for bluez-utils package
	(cd ./feeds/packages && git apply $DIR/files/feeds_bluez_add_gatttool.patch)
	# remove configs for alljoyn
	#(cd ./feeds/alljoyn && git apply $DIR/files/feeds_alljoyn_start_wo_config.patch)
	cp -f $DIR/files/feeds_alljoyn_start_wo_config.init ./feeds/alljoyn/alljoyn/files/alljoyn.init
	# copy build config
	cp $DIR/files/D_LINK_DIR-505LA1.config ./.config
	# mark that we configured sources
	touch DA.MARK
	# build all
	make -j 8
fi
