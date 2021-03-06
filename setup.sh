# setup.sh
#   Set up all my configs: Downloads emacs plugins and modes, bash git
#   prompt, and creates symlinks of relevant dot files in home directory

SCRIPTNAME=$(basename $0)
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


### Emacs setup

# Setup julia-emacs mode
if [ ! -d ~/.emacsconfig/julia-emacs ];
then
    mkdir -p ~/.emacsconfig/julia-emacs
    git clone https://github.com/JuliaLang/julia-emacs.git ~/.emacsconfig/julia-emacs
 else
     echo "$SCRIPTNAME: emacs-julia mode already installed"
fi

# Color-Theme setup
if [ ! -d ~/.emacs.d/color-theme-6.6.0 ];
then
    wget http://download.savannah.nongnu.org/releases/color-theme/color-theme-6.6.0.tar.gz
    tar xz color-theme-6.6.0.tar.gz && rm color-theme-6.6.0.tar.gz
    mkdir -p ~/.emacs.d/
    mv color-theme-6.6.0 ~/.emacs.d/
else
    echo "$SCRIPTNAME: color-theme already installed"
fi
# ESS setup

if [ ! -d ~/.emacsconfig/ESS ];
then
    mkdir -p ~/.emacsconfig/ESS
    git clone git://github.com/emacs-ess/ESS.git ~/.emacsconfig/ESS

    # move to that directory and make all
    mydir="$( pwd)"
    cd ~/.emacsconfig/ESS
    make all
    cd $mydir
 else
    echo "$SCRIPTNAME: ESS already installed"
fi



### Bash setup

# Setup git-aware-prompt
if [ ! -d ~/.bash/git-aware-prompt ];
then
    mkdir -p ~/.bash/git-aware-prompt
     git clone https://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt
 else
     echo "$SCRIPTNAME: git-aware-prompt already installed"
fi


# Setup Jawn
if [ ! -d ~/Jawn ];
then
    mkdir -p ~/Jawn
    git clone https://github.com/MattCocci/Jawn.git ~/Jawn
 else
    echo "$SCRIPTNAME: Jawn already installed"
fi


### Dotfiles
for FILE in .bashrc .emacs .tmux.conf .gitconfig;
do
    if [ ! -h "$HOME/$FILE" ];
    then
        ln --symbolic --target-directory $HOME $SCRIPTDIR/$FILE
    else
        echo "$SCRIPTNAME: $FILE already linked"
    fi
done
