# dbml.vim

DBML(Database Markup Language) is an open-source DSL language designed to define and document database schemas and structures. It is designed to be simple, consistent and highly-readable.

This [vim](https://www.vim.org/) plugin provide nice syntax coloring.
It also includes a filetype plugin to autodetect your `.dbml` files.

Notable features include:

    `Ref:` and `Note:` coloring validates correct syntax.

# Installation

Copy the included directories into your .vim or vimfiles directory.

Or use [pathogen.vim][1] and simply pull it in like this:

    cd ~/.vim/bundle
    git clone https://github.com/jidn/vim-dbml.git

# Folding

The dbml syntax file provides syntax folding for table and index blocks.

When 'foldmethod' is set to "syntax" then blocks will be
folded unless you use the following in your .vimrc or before opening a script:

    :let g:dbml_nofold_blocks = 1

# Comments and Suggestions

Please follow, fork or submit issues on [GitHub][2] and if you
find it useful, please vote for it on [vim.org][3].

# License

    Copyright 2019 Clinton James
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
    http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

# Version History

* v1.0 (2019-09-01) Initial release

[1]: https://github.com/tpope/vim-pathogen
[2]: https://github.com/jidn/vim-dbml
[3]: http://www.vim.org/scripts/script.php?script_id=5823
