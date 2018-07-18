#!/bin/sh

forever stop mai-trinh
rm -rf ~/.forever/mai-trinh.log.previous
mv ~/.forever/mai-trinh.log mai-trinh.log.previous
forever --uid mai-trinh -o out.server -e error.server start app.js
forever list
tail -f ~/.forever/mai-trinh.log