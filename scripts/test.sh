#!/usr/bin/env bash

cd $WORKSPACE/ch_4/test_puppies
HEADLESS=true cucumber --format junit --out $WORKSPACE/report
