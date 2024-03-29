# My dotfiles

It seems what I am doing here is called dotfiles, will refactor the setup to some common standard one day.

# VSCode

My favorite editor. I don't have a lot of settings but the ones I have I'm not changing anytime soon.

## User settings

Code > Preferences > Settings  
Then click three dots and `Open settings.json`.
```json
{
    "editor.tabSize": 2,
    "window.zoomLevel": 0,
    "search.exclude": {
        "**/node_modules": true,
        "**/bower_components": true
    },
    "extensions.ignoreRecommendations": false,
    "python.linting.pylintEnabled": false,
    "explorer.confirmDragAndDrop": false,
    "editor.minimap.enabled": false,
    "editor.fontFamily": "'Fira Code'",
    "editor.fontLigatures": true,
    "editor.fontWeight": "100",
    "editor.wordWrap": "on",
    "terminal.integrated.fontFamily": "monospace",
    "files.autoSave": "afterDelay",
    "files.autoSaveDelay": 100,
    "files.eol": "\n",
    "breadcrumbs.enabled": true
}
```
You need to install Fira Code in order it to work. https://github.com/tonsky/FiraCode

## Extensions

* Docker
* VS Live Share
* nginx.conf hint
* Code Spell Checker
* vscode-styled-components
* TSLint
* Import Cost

## Keyboard shortcuts

Code > Preferences > Keyboard shortcuts  
Click `keybindings.json`.
```json
// Place your key bindings in this file to overwrite the defaults
[
  { "key": "ctrl+shift+t",    "command": "workbench.action.terminal.toggleTerminal" }
]
```

# Bash

`.bashrc` (or `.bash_profile` in macOS since `.bashrc` is not loaded automatically..). Should be located in `~/.bashrc`.
```
ds() {
  du -hd1
}

rm-images() {
  local GREP_STRING=$1
  rm-containers "${GREP_STRING}"
  docker images | grep "${GREP_STRING}" | awk '{print $3}' | xargs docker rmi -f
}

rm-containers() {
  local GREP_STRING=$1
  OLD_CONTAINER_ID="$(docker ps -a | grep ${GREP_STRING} | awk '{print $1}')"
  docker stop "${OLD_CONTAINER_ID}" || true
  docker rm -f "${OLD_CONTAINER_ID}" || true
}

tar-help() {
cat << EOF

tar

Examples:

tar xvzf file.tar.gz - tgfo uncompress a gzip tar file (.tgz or .tar.gz)
tar xvjf file.tar.bz2 - to uncompress a bzip2 tar file (.tbz or .tar.bz2) to extract the contents.
tar xvf file.tar - to uncompressed tar file (.tar)
tar xvC /var/tmp -f file.tar - to uncompress tar file (.tar) to another directory

x = eXtract, this indicated an extraction c = create to create )
v = verbose (optional) the files with relative locations will be displayed.
z = gzip-ped; j = bzip2-zipped
f = from/to file ... (what is next after the f is the archive file)
C = directory. In c and r mode, this changes the directory before adding the following files. In x mode, changes directoriy after opening the archive but before extracting entries from the archive.

The files will be extracted in the current folder (most of the times in a folder with the name 'file-1.0').

EOF
}

ssh-add ~/.ssh/github-oma ~/.ssh/github-ws > /dev/null 2>&1
```
Now each of those functions should be available from the command line eg `tar-info` and also ssh-agent should automatically load the two ssh-keys I have specified (which you should change accordingly). Loading all keys from `.ssh` is not probably smart.

# Git

## Create "git lg" alias that is a better version of log
`git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"`

These two are for having two Github accounts with separate keys. Setting the email per git-project will keep the accounts separated:

This is true by default in macOS which will cause immensely frustrating bugs.

`git config --global core.ignorecase false`

And when you do mess up, you need to remove the cached file first by eg: `git rm -r --cached ./src/routes.tsx`

## Require setting user.name and email per-repo:
`git config --global user.useConfigOnly true`

## Remove email address from global config:
`git config --global --unset-all user.email`

My `.gitconfig` currently:
```
[user]
	name = Teemu Koivisto
	useConfigOnly = true
[core]
        autocrlf = false # NO CRLF in Windows
        eol = lf # Force LF line endings
[credential "https://git-codecommit.*.amazonaws.com"]
    helper = !aws codecommit credential-helper $@ 
    UseHttpPath = true
[credential]
	helper = osxkeychain
	UseHttpPath = true
[alias]
	lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
```
I think osxkeychain is macOS only. Maybe there's some magic here that I've used and forgot. Oh well.

That `lg` is super cool, try it `git lg`.

# SSH

Inside `~/.ssh` folder I've often used `config`-file like this:
```
Host github
  HostName github.com
  User git
  IdentityFile ~/.ssh/github-oma
```
Keys I think I've generated with default settings: `ssh-keygen`.

# AWS-cli

`~/.aws/config`
```
[default]
region=eu-west-1
output=json
```

# macOS

Install [Homebrew](https://brew.sh/) and probably as well aws-cli, nvm & Node.js, Python 3, Sceptre, Docker, VSCode, Chrome and other apps I can't think of now.

## Terminal

Makes the typing speed bearable in macOS (the default speed is sooper slow). You have to log out to see the effects.
```
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15
```

## System settings

* `Keyboard > tick "Use F1, F2 etc. keys as standard function keys"` if not already ticked. This enables the use of workspaces etc
* `Keyboard > Text > untick "Use smart quotes and dashes"` because they are annoying as hell and useless
* `Keyboard > Shortcuts > tick "Invert colors" and double-click the shortcut > assign it to Cmd+Q` because it's such fun when you accidentally close your browser [source](https://apple.stackexchange.com/questions/78948/how-to-disable-command-q-for-quit)
* `Mission Control > untick "Automatically rearrange Spaces based on most recent use"` so annoying...
* `Trackpad > untick "Smart Zoom" and optionally "Scroll direction: Natural"` smart zoom is just useless and I don't know about the scrolling direction. Ehh.
