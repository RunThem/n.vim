<div align="center">

# n.vim

*A minimal, hand-rolled Neovim configuration in Lua.*

[![Neovim](https://img.shields.io/badge/Neovim-v0.13%20dev-29A343?logo=neovim&logoColor=white)](https://github.com/neovim/neovim)
[![Lua](https://img.shields.io/badge/Made%20with-Lua-2C2D72?logo=lua&logoColor=white)](https://www.lua.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![stylua-check](https://github.com/RunThem/n.vim/actions/workflows/stylua-check.yml/badge.svg)](https://github.com/RunThem/n.vim/actions/workflows/stylua-check.yml)

**English** | [简体中文](README.zh-CN.md)

</div>

---

## 📖 About

n.vim is my personal Neovim configuration, written entirely in Lua with a "less is more" philosophy: a tiny set of carefully chosen plugins, plus a handful of first-party mini-plugins that replace most third-party utilities. It targets the Neovim v0.13 development build and is macOS-first.

Based on [Cosynvim](https://github.com/glepnir/cosynvim).

## ✨ Highlights

- ⚡ **Tiny footprint**: a dozen pinned plugins, all lazy-loaded on `VeryLazy`
- 🧩 **First-party mini-plugins**: `flybuf` (buffer switcher), `whiskyline` (statusline), session persistence, cursor-word and multi-word highlighting, smart search highlighting, last-position restore; all hand-written in `plugin/`, no plugin manager involved
- 🎨 **`porcelain`**: a custom dark-only colorscheme
- 🔌 **Native LSP**: servers managed by `vim.lsp.enable()`, no nvim-lspconfig (clangd, gopls, rust_analyzer, emmylua_ls, xmake_ls, lelwel_ls)
- 🔍 **fzf-lua + skim**: fuzzy finding powered by `sk`
- 💡 **blink family**: `blink.cmp`, `blink.pairs` and `blink.indent` for completion, autopairs and indent guides
- 🧹 **guard.nvim + lspsaga**: formatting via clang-format, stylua and golines; LSP UI via lspsaga

## 📦 Requirements

- Neovim **v0.13** (development build / Homebrew HEAD)
- `git`, `ripgrep` and `skim` (`sk`) on your `$PATH`
- Formatters and LSP servers (clang-format, stylua, gopls, ...) installed separately as needed

> [!NOTE]
> The config is macOS-first: the clipboard is wired through `pbcopy`/`pbpaste`.

## 🚀 Installation

1. **Back up your existing configuration first.**
2. **Clone the repo:**

   ```sh
   git clone https://github.com/RunThem/n.vim.git ~/.config/nvim
   ```

3. **Start `nvim`.** lazy.nvim is bootstrapped automatically and all plugins are installed on the first launch.

## 📄 License

Released under the [MIT](LICENSE) License.
