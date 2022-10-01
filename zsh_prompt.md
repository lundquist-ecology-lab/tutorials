## Zsh prompt with red arrow

Add to ~/.zshrc

```shell
hostcolor=197
zstyle ':vcs_info:git*' formats "%{$fg[blue]%}#%b%{$reset_color%}"
PROMPT='%~${vcs_info_msg_0_} %F{$hostcolor}> %f'
```
![img](./screenshots/zsh_prompt.png)
