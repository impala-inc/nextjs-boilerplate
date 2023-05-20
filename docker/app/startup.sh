#!/bin/sh -e

sudo chown -R 1000:1000 .

if ! [ -f package.json ] ; then
  # Install next.js app in tmp directory
  yarn create next-app tmp \
                       --app \
                       --ts \
                       --tailwind \
                       --eslint \
                       --src-dir \
                       --experimental-app "No"\
                       --import-alias "@/*"

  # Copy next.js app to working directory
  rm -r tmp/node_modules
  mv tmp/* tmp/.[^\.]*  .
  rm -r tmp
fi
yarn install
yarn dev
