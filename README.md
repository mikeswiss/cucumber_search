Paxos Search
========================
### Installation
0. Install Rvm
0. Use rvm to install and select ruby 2.4 ```rvm install ruby-2.4 ```
0. Install bundler and bundle install
```
gem install bundler
bundle install
```
### set environment variable for browser (Chrome, Firefox, etc)
```export BROWSER=chrome```
#### make sure your in the search directory
```rake```
#### output report will be in output/my_test_report.html
### note running cucumber features/paxos_search.feature will not generate the report
