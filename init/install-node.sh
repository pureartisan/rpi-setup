#!/bin/bash

echo "=== Installing NODE ====================="

DOWNLOAD_TAR_XZ_FILE_URL=https://nodejs.org/dist/latest-v10.x/node-v10.14.1-linux-armv6l.tar.xz

cd ~

# download from the specified URL
wget -O nodejs.tar.xz $DOWNLOAD_TAR_XZ_FILE_URL

# extract
tar -xvf nodejs.tar.xz --one-top-level=nodejs-temp-download

# go into the extracted directory, note there's a top level direcotry with original download file name
re='node-.+'
for dir in ./nodejs-temp-download/*; do
  [[ $dir =~ $re ]] && { cd "$dir" && break; }
done

# copy to apps
sudo cp -R * /usr/local/

# clean up
cd ~
rm -rf nodejs-temp-download
rm -f nodejs.tar.xz

# verify
node -v
npm -v


echo "=== Installing NODE >>> DONE! ==========="