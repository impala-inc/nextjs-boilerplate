#!/bin/sh -e

if ! [ -f package.json ] ; then
  sudo chown -R 1000:1000 node_modules

  yarn create next-app sampleapp \
                                --ts \
                                --tailwind \
                                --eslint \
                                --src-dir \
                                --experimental-app "No"\
                                --import-alias "@/*"
  rm -r sampleapp/node_modules
  mv sampleapp/* sampleapp/.[^\.]*  .
  rm -r sampleapp
fi
yarn install
yarn dev
