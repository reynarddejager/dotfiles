# dotfiles & install scripts

## Install

Clone the repo:

```bash
mkdir -p $HOME/Projects
git clone git@github.com:reynarddejager/dotfiles.git ~/Projects/dotfiles
```

We are using [RCM](https://github.com/thoughtbot/rcm) for dotfile management:

```bash
sudo apt install rcm
```

Install dotfiles:

```bash
env RCRC=$HOME/Projects/dotfiles/rcrc rcup
```

Install scripts:

```bash
# Install apt packages:
./apt

# Install snap packages:
./snaps

# Install Ubuntu & GNOME customisation:
./ubuntu

# Install Dev toolchain:
./dev-toolchain
```

## RCM Usage

List rc files managed by **RCM**:

```bash
lsrc
```

Create/Update any symlinks for rc files located in the dotfiles directory:

```bash
rcup
```

Create a new rc file to the dotfiles directory:

```
mkrc .bashrc
```

See the [RCM](https://thoughtbot.github.io/rcm/rcm.7.html) documentation for more detail.
