# teamspirit

**DO NOT USE**

## dependency
- install firefox
- you must run Xvfb as daemon.
- write crontab like below
```
 48  9  *  *  1,2,3,4,5 /bin/bash -lc 'cd ${HOME}/teamspirit/ && export DISPLAY=:99.0 && EMAIL=motchang@gmail.com PASSWORD=hogehoge bundle exec ruby lazy.rb i 2>&1'
 10 19  *  *  1,2,3,4,5 /bin/bash -lc 'cd ${HOME}/teamspirit/ && export DISPLAY=:99.0 && EMAIL=motchang@gmail.com PASSWORD=hogehoge bundle exec ruby lazy.rb o 2>&1'
```
