# My Development Environment

I noticed that I had not documented my settings in any way which might be a good idea were I to switch laptops etc.

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

`.bashrc` Should be located in `~/.bashrc`.
```
function tar-help() {
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
```
Now there should be `tar-info` command available in command line as I can't for the love of God remember those tar flags.

# Git

## Create "git lg" alias that is a better version of log
`git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"`

These two are for having two Github accounts with separate keys. Setting the email per git-project will keep the accounts separated:

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
  IdentityFile ~/.ssh/github
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

## Terminal

Makes the typing speed bearable in macOS (the default speed is sooper slow).
```
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15
```

## System settings

Näppäimistö > text > käytä älykkäitä hipsuja jne POIS

Ohjauslevy: Disable älykäs zoom

Sitten estä ettei workspaceja ei voi liikuttaa

Ja että Super + Q ei lopeta ohjelmaa

TODO: translate

