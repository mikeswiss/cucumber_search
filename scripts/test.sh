#!/usr/bin/env bash

export PATH=/usr/local/rvm/gems/ruby-1.9.3-p429/bin:/usr/local/rvm/gems/ruby-1.9.3-p429@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p429/bin:/usr/local/rvm/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin
cd $WORKSPACE/ch_4/test_puppies
HEADLESS=true cucumber --format junit --out $WORKSPACE/report
