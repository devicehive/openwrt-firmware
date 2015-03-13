OpenWRT firmware for D-LINK DIR505A with intergated DeviceHive gateways.

Beforu build make sure that this packages are installed:
sudo apt-get install build-essential flex gawk git-core libncurses5-dev libssl-dev mkisofs subversion quilt zlib1g-dev

To build image, just run - give_me_the_image.sh
ready image will be in ./trunk/bin/ar71xx directory
-sysupgrade.bin and -factory.bin should appear, if it's not, firmware size is overflowed

To build one separate package call:
make package/package-name/compile V=s
in ./trunk directory
