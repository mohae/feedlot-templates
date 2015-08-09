# install commonly used programs
# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
apt-get install -y -f

# chromium
apt-get update
apt-get install -y chromium chromium-l10n

# use linuxmint for firefox instead of debians iceweasel(firefox)
echo deb http://packages.linuxmint.com debian import > /etc/apt/sources.list.d/linuxmint.list
apt-get update
apt-get install -y --force-yes firefox