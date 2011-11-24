## best vimrc

githubにあるvimrcの中で一番参考になるvimrcを探すWebアプリ。
社内backbone.js勉強会のための習作。
http://best-vimrc.heroku.com/

### First, sync github to local repos
  bundle exec rake cron

### When use heroku, add cron plugin
  heroku addons:add cron:daily

### Before production deploy to heroku
  script/pre-production.sh
