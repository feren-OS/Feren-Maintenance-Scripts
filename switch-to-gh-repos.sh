#!/bin/bash

if [ ! "$(whoami)" = "root" ]; then
    echo "Not running as root, exiting."
    exit 1
fi

/usr/bin/reset-feren-ppas

if [ -f /etc/apt/sources.list.d/feren-os-nonlts.list ]; then
    sed -i 's%http://sourceforge.net/projects/feren-os-repositories/files/nonlts/%https://github.com/feren-OS/Feren-Repository-nonlts/raw/master%g' /etc/apt/sources.list.d/feren-os-nonlts.list
fi
sed -i 's%http://sourceforge.net/projects/feren-os-repositories/files/stable/%https://github.com/feren-OS/Feren-Repository/raw/master%g' /etc/apt/sources.list.d/feren-os.list
sed -i 's%http://sourceforge.net/projects/feren-os-repositories/files/software/%https://github.com/feren-OS/Feren-Repository-software/raw/master%g' /etc/apt/sources.list.d/feren-os.list
if [ -f /etc/apt/sources.list.d/feren-os-neonrequired.list ]; then
    sed -i 's%http://sourceforge.net/projects/feren-os-repositories/files/neon-required/%https://github.com/feren-OS/Feren-Repository-neon/raw/master%g' /etc/apt/sources.list.d/feren-os-neonrequired.list
fi
apt update
echo "Repositories switched, thanks for choosing Feren OS. Hopefully more improvements will be coming soon."
exit 0
