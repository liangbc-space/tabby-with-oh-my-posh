# -------------------------------------------------
# 1. Zsh 补全系统初始化（必须最早！）
# -------------------------------------------------
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# -------------------------------------------------
# 2. Oh My Posh
# -------------------------------------------------
eval "$(oh-my-posh init zsh --config ~/.poshthemes/agnosterplus.omp.json)"

# -------------------------------------------------
# 3. fzf 快捷键支持
# -------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -------------------------------------------------
# 4. 插件（顺序敏感！）
# -------------------------------------------------
# 语法高亮（必须在 fzf-tab 之前）
[[ -f ~/.plugin.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]] && \
  source ~/.plugin.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# fzf-tab（必须是最后一个插件！）
[[ -f ~/.plugin.zsh/fzf-tab/fzf-tab.plugin.zsh ]] && \
  source ~/.plugin.zsh/fzf-tab/fzf-tab.plugin.zsh

# -------------------------------------------------
# 5. 自定义配置（别名、函数等，放最后）
# -------------------------------------------------
[[ -f ~/.plugin.zsh/common-aliases/common-aliases.plugin.zsh ]] && \
  source ~/.plugin.zsh/common-aliases/common-aliases.plugin.zsh