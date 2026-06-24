#!/bin/bash

set -ouex pipefail

HOME_URL="https://github.com/Plyply99/PlyplyOS"
# OS Release File (changed in order with upstream)
# TODO: change ANSI_COLOR
sed -i -f - /usr/lib/os-release <<EOF
s|^NAME=.*|NAME=\"PlyplyOS\"|
s|^PRETTY_NAME=.*|PRETTY_NAME=\"PlyplyOS\"|
s|^VERSION_CODENAME=.*|VERSION_CODENAME=\"44\"|
s|^VARIANT_ID=.*|VARIANT_ID=""|
s|^HOME_URL=.*|HOME_URL=\"${HOME_URL}\"|
s|^BUG_REPORT_URL=.*|BUG_REPORT_URL=\"${HOME_URL}/issues\"|
s|^SUPPORT_URL=.*|SUPPORT_URL=\"${HOME_URL}/issues\"|
s|^CPE_NAME=\".*\"|CPE_NAME=\"cpe:/o:plyplyos-dev:plyplyos\"|
s|^DOCUMENTATION_URL=.*|DOCUMENTATION_URL=\"${HOME_URL}\"|
#s|^DEFAULT_HOSTNAME=.*|DEFAULT_HOSTNAME="plyply-pc"|

/^REDHAT_BUGZILLA_PRODUCT=/d
/^REDHAT_BUGZILLA_PRODUCT_VERSION=/d
/^REDHAT_SUPPORT_PRODUCT=/d
/^REDHAT_SUPPORT_PRODUCT_VERSION=/d
EOF
echo "VARIANT_ID=container" >> /usr/lib/os-release
ln -s fedora-release /usr/lib/system-release
