# AGENTS.md

## 全局约定

- 语言: 本文件及所有输出统一使用中文, 代码标识符与专有名词保留英文原文. commit message 除外.
- 标点: 所有输出(写入文件的注释 / 文档, 以及回显给用户的回复), 无论中文还是英文, 一律使用英文标点(, . : ; ( ) - _ /), 不使用中文标点(如 ， 。 ： ； （ ） 、).

个人 Neovim 配置("n.vim"). 不是可构建的项目: 没有构建步骤, 没有测试, 没有包管理器. 目标为 Neovim v0.13 dev(Homebrew HEAD).

## 架构(加载顺序)

```
init.lua           → v0.13 兼容补丁, 设置 vim.g.mod, require('core')
lua/core/init.lua  → 禁用内置插件, 设置 leader, 依次加载 core 模块
lua/core/util.lua  → 定义全局 _G.util 与 _G.map(require('core') 之后随处可用)
lua/core/opt.lua   → vim 选项, 按操作系统区分(Darwin 剪贴板经 pbcopy/pbpaste)
lua/core/key.lua   → 键位映射
lua/core/lang.lua  → 诊断配置, 自动启用 LSP(通配 lsp/*.lua)
lua/mod/init.lua   → lazy.nvim 引导与 setup(lazypath: ~/.local/share/nvim/lazy/lazy.nvim)
lua/mod/mods.lua   → 插件 spec, 经局部 mod() 包装插入
lua/mod/conf/      → 各插件的配置函数
lsp/               → LSP 启用文件(自动加载, 不是 nvim-lspconfig)
plugin/            → 自动 source 的插件(sessions, hlsearch, flybuf, whiskyline, ...)
after/             → ftplugin 与 syntax 覆盖
snippets/          → LuaSnip 代码片段
colors/            → porcelain 配色方案
lua/dev.lua        → gitignore 忽略的草稿缓冲区(经 <Leader>d 加载)
lua/script.lua     → 独立脚本(<Leader>X 编辑, <Leader>x 执行第一行)
```

## 非显而易见的约定

- `_G.map` 与 `_G.util` 是全局变量, 直接使用, 无需 require 任何东西.
- 键位 API: `map[mode](key, expr, is_expr)`. 以 `:` 开头的字符串会自动包上 `<Cmd>...<Cr>`. 可用模式: n, i, c, v, x, t, s.
- 插件 spec 通过 `mods.lua` 里的局部 `mod()` 包装函数插入表, 而非 lazy.nvim 的 `return {}` 模式. 大多数插件在 `VeryLazy` 时加载; 配置函数放在 `lua/mod/conf/<name>.lua`, 以 `config = require('mod.conf.<name>')` 的形式接线.
- LSP server 使用 `vim.lsp.enable()`(新 API), 在 `lsp/` 下新增一个与 server 同名的文件即可. `lang.lua` 会启用其中除 `clice` 与 `ccls` 外的全部文件, 这两个是有意保持禁用的.
- 使用 `vim.uv`(Neovim 0.11+), 永不使用 `vim.loop`.
- 针对 nvim/插件版本怪癖的 monkey patch 用 `---@patch:` 注释标出并说明原因(见 `init.lua` 的 `_get_line_byte_from_position`, 以及 `lua/mod/conf/saga.lua` 的 lspsaga beacon 宽度守卫). 类似的兼容垫片请沿用这一模式.
- lazy.nvim 在 `mod/init.lua` 中内联引导, 以 `vim.g.mod` 作为开关.
- 提交风格: 单行英文 `(scope) subject`. 在用的 scope: `config`, `plugin`, `package`(仅用于版本号变更).

## 格式化

```bash
stylua .                # 格式化所有 Lua 文件
stylua --check .        # 仅检查(与 CI 一致)
```

CI(GitHub Actions)在 push/PR 时运行 `stylua --check .`. 配置见 `.stylua.toml`(使用空格, 缩进 2, 行宽 120, 优先单引号, 调用始终带括号).
