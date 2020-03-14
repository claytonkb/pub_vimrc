mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/plugin
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Add this line to your vimrc:"
echo "execute pathogen#infect()"

