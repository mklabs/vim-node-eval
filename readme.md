vim-node-eval
-------------


Simple `node -pe` thing for vim.

Install
-------

Assuming you have pathogen installed, simply git clone this repository into one of your bundle path.

```sh
git clone <this_repo> ~/.vim/bundle/vim-node-eval
```

Add a mapping to your ~/.vimrc (change the key to suit your taste):

```vim
noremap <Leadder>b :NodeEval
```

Usage
-----

This plugin expose a single command `:NodeEval`. This is a range command.

You highlight text you want to execute, and the plugin pass it through `node -pe` command.

```js
var url = require('url');
url.parse('https://github.com/mklabs/vim-node-eval');
```

Assuming in this markdown file, the range of the snippet above is `25,26`.

    :25,26NodeEval

    var url = require('url');
    url.parse('https://github.com/mklabs/vim-node-eval');
    { protocol: 'https:',
      slashes: true,
      host: 'github.com',
      hostname: 'github.com',
      href: 'https://github.com/mklabs/vim-node-eval',
      pathname: '/mklabs/vim-node-eval',
      path: '/mklabs/vim-node-eval' }

The result is simply echoed back to the console.

## Clam Integration

[Clam](https://github.com/sjl/clam.vim) is a very handy plugin to execute any
kind of shell commands.

Turns out that it plays super nicely with `node -pe`, so `:NodeEval` will use
Clam whenever it detects the `:Clam` command.

The same snippet will use the same window as before, variations will open a new
one.

## Mapping

The plugin adds `<leader>b` mapping automatically.

You can prevent this and deal with it manually. Add the mapping to your ~/.vimrc:

    let g:node_eval_map_keys = 0

    # change the key to suit your taste
    noremap <leader>b :NodeEval<CR>
