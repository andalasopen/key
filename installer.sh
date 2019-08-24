#!/bin/sh
##setup command=wget http://tunisia-dreambox.info/TSplugins/AddKey/installer.sh -O - | /bin/sh

version=3.0
description='NEW [Add option to enable/Disable check update]'

# remove old version
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/AddKey
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/Biscotto

# Download and install plugin

cd /tmp 
set -e
wget "https://raw.githubusercontent.com/andalasopen/key/master/AddKey-"$version".tar.gz"

tar -xzf AddKey-"$version".tar.gz -C /
set +e
rm -f AddKey-"$version".tar.gz
cd ..

sync
echo "#########################################################"
echo "#            AddKey INSTALLED SUCCESSFULLY              #"
echo "#                 Raed  &  mfaraj57                     #"              
echo "#                     support                           #"
echo "#   https://www.tunisia-sat.com/forums/threads/3955125/ #"
echo "#########################################################"
echo "#           your Device will RESTART Now                #"
echo "#########################################################"
sleep 3
if [ -f /var/lib/dpkg/status ]; then
    init 4 && init 5
else
    init 4 && init 3
fi
exit 0
