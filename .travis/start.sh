#!/usr/bin/env bash
pwd
git clone -b develop https://github.com/telepat-io/telepat-worker.git
cd telepat-worker
npm install
cd ..
forever start --append --uid "aggregation" telepat-worker/index.js -t aggregation -i 0
forever start --append --uid "write" telepat-worker/index.js -t write -i 0
forever start --append --uid "update_friends" telepat-worker/index.js -t update_friends -i 0
forever start --append --uid "android" telepat-worker/index.js -t android_transport -i 0
forever start --append --uid "ios" telepat-worker/index.js -t ios_transport -i 0
exit 0
