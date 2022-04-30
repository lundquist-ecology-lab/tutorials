## Zsh prompt with red arrow

Taken from this [Reddit post](https://www.reddit.com/r/unixporn/comments/5vke7s/osx_iterm2_tmux_vim/)
```
hostcolor=197
zstyle ':vcs_info:git*' formats "%{$fg[blue]%}#%b%{$reset_color%}"
PROMPT='%~${vcs_info_msg_0_} %F{$hostcolor}> %f'
```

![img](./screenshots/zsh_prompt.png)
