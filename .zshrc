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
eval "$(oh-my-posh init zsh --config $HOME/.poshthemes/agnosterplus.omp.json)"

# -------------------------------------------------
# 3. fzf 快捷键支持
# -------------------------------------------------
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# -------------------------------------------------
# 4. 插件（顺序敏感！）
# -------------------------------------------------
# 语法高亮（必须在 fzf-tab 之前）
[[ -f $HOME/.plugin.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]] && \
  source $HOME/.plugin.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# fzf-tab（必须是最后一个插件！）
[[ -f $HOME/.plugin.zsh/fzf-tab/fzf-tab.plugin.zsh ]] && \
  source $HOME/.plugin.zsh/fzf-tab/fzf-tab.plugin.zsh

# -------------------------------------------------
# 5. 自定义配置（别名、函数等，放最后）
# -------------------------------------------------
[[ -f $HOME/.plugin.zsh/common-aliases/common-aliases.plugin.zsh ]] && \
  source $HOME/.plugin.zsh/common-aliases/common-aliases.plugin.zsh


# 我的IP
myip() {
    echo "直连 IP : $(curl -4 -s --max-time 5 https://ipinfo.io/ip)"
    echo "代理 IP : $(curl -4 -s --max-time 5 https://api.ipify.org)"
}