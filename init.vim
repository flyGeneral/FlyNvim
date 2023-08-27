" 配置文件导入 "{{{
" ---------------------------------------------------------------------
" 基础使用习惯配置
runtime ./vimrc.vim
" 插件管理
"./lua/plugins.lua
lua require('plugins')
lua require('plugin-config.lualine')
" 按键映射
runtime ./maps.vim

"接下来配置一下主题
"主题的配置文件引一下
source ~/.config/nvim/colors/gruvbox_material.rc.vim
