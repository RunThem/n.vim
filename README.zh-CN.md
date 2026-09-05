<div align="center">

# n.vim

*一份用 Lua 手写的极简 Neovim 配置.*

[![Neovim](https://img.shields.io/badge/Neovim-v0.13%20dev-29A343?logo=neovim&logoColor=white)](https://github.com/neovim/neovim)
[![Lua](https://img.shields.io/badge/Made%20with-Lua-2C2D72?logo=lua&logoColor=white)](https://www.lua.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![stylua-check](https://github.com/RunThem/n.vim/actions/workflows/stylua-check.yml/badge.svg)](https://github.com/RunThem/n.vim/actions/workflows/stylua-check.yml)

[English](README.md) | **简体中文**

</div>

---

## 📖 关于 n.vim

我的个人 Neovim 配置, 完全用 Lua 编写, 秉持"少即是多"的理念: 只保留少量精心挑选的插件, 其余常用功能由若干第一方迷你插件自己实现. 配置以 Neovim v0.13 开发版为目标, 优先适配 macOS.

基于 [Cosynvim](https://github.com/glepnir/cosynvim).

## ✨ 特性亮点

- ⚡ **极小足迹**: 十余个锁定版本的插件, 全部在 `VeryLazy` 时懒加载
- 🧩 **第一方迷你插件**: `flybuf` (缓冲区切换器), `whiskyline` (状态栏), 会话持久化, 光标词与多词高亮, 智能搜索高亮, 恢复上次光标位置; 全部手写于 `plugin/`, 不经插件管理器
- 🎨 **`porcelain`**: 自制的暗色配色方案
- 🔌 **原生 LSP**: server 由 `vim.lsp.enable()` 管理, 不依赖 nvim-lspconfig (clangd, gopls, rust_analyzer, emmylua_ls, xmake_ls, lelwel_ls)
- 🔍 **fzf-lua + skim**: 模糊查找后端为 `sk`
- 💡 **blink 家族**: `blink.cmp`, `blink.pairs`, `blink.indent` 负责补全, 自动配对与缩进参考线
- 🧹 **guard.nvim + lspsaga**: clang-format, stylua, golines 负责格式化; lspsaga 提供 LSP UI

## 📦 依赖要求

- Neovim **v0.13** (开发版 / Homebrew HEAD)
- `$PATH` 中需有 `git`, `ripgrep` 和 `skim` (`sk`)
- 格式化工具与 LSP server (clang-format, stylua, gopls 等) 按需自行安装

> [!NOTE]
> 本配置优先适配 macOS: 剪贴板通过 `pbcopy`/`pbpaste` 接入.

## 🚀 安装

1. **先备份现有配置.**
2. **克隆仓库:**

   ```sh
   git clone https://github.com/RunThem/n.vim.git ~/.config/nvim
   ```

3. **启动 `nvim`.** 首次运行时会自动 bootstrap lazy.nvim 并安装全部插件.

## 📄 许可证

以 [MIT](LICENSE) 许可证发布.
