# Tsukiji

![Tsukiji](https://git.dev.rakuten.com/projects/ITT/repos/new-uacc/browse/tsukiji.png?raw)
Tsukiji is the replacement of the current UACC system.

See also [New UACC - CITD Infrastructure Tools ](https://confluence.rakuten-it.com/confluence/x/kwRHKg)

# Deploy to production/staging

(TBD)

# Run locally

## Ruby environment

First, install [rbenv](https://github.com/rbenv/rbenv) and ruby 2.2.3.

```bash
% git clone https://github.com/rbenv/rbenv.git ~/.rbenv
% echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
% echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
% source ~/.bash_profile
# If you use another shell, modify the destination as necessary

% git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

Then install ruby and confirm if it works.

```bash
% rbenv install 2.2.3
% rbenv global 2.2.3  # Set 2.2.3 system-wide default
% ruby --version
ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin15]
```

## Bring app and run

Please be sure that you're local git is properly configured in order to prevent permission denied error when cloning the app.
Then prepare application code, and install some dependent libraries and gems (ruby library packages).
This process is required basically at the first time only.

```bash
% cd SOMEWHERE
% git clone ssh://git@git.rakuten-it.com:7999/itt/new-uacc.git
% cd new-uacc
% git checkout -b BRANCH_NAME origin/BRANCH_NAME # if not master
% gem install bundler
% bundle install
% sudo apt-get install nodejs   # use yum for centos
```

And run the application!

```bash
% rails s
```

## Open page

```bash
% open 'http://localhost:3000/auth'
```

