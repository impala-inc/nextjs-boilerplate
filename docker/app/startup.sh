#!/bin/sh -e

if ! [ -f package.json ] ; then
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
