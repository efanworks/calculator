#!/bin/zsh

# 本脚本演示如何安全地设置 TOKEN 并发布包

# 保存当前代理设置（如果有）
OLD_HTTP_PROXY=$http_proxy
OLD_HTTPS_PROXY=$https_proxy
OLD_ALL_PROXY=$all_proxy

# 临时取消设置代理变量，避免本地连接经过代理
unset http_proxy
unset https_proxy
unset HTTP_PROXY
unset HTTPS_PROXY
unset all_proxy
unset ALL_PROXY

# 显示已清除代理设置的消息
echo "已临时清除代理设置用于本地连接"

# 从环境变量或配置文件加载 TOKEN
if [ -f ~/.npm_tokens ]; then
  # 从配置文件加载 TOKEN (格式: export NPM_TOKEN="your-token")
  source ~/.npm_tokens
  echo "从 ~/.npm_tokens 加载了 NPM_TOKEN"
elif [ -z "$NPM_TOKEN" ]; then
  # 如果没有设置，提示用户手动输入
  echo "请输入您的 NPM TOKEN:"
  read -s NPM_TOKEN  # -s 选项会隐藏输入
  export NPM_TOKEN
  echo "NPM_TOKEN 已从输入设置"
else
  echo "使用已存在的 NPM_TOKEN 环境变量"
fi

# 安全地显示 TOKEN 存在的消息（不显示具体值）
echo "NPM_TOKEN 已设置 (${NPM_TOKEN:0:4}...${NPM_TOKEN: -4})"


# 检查是否设置了 NPM_TOKEN 环境变量
if [ -z "$NPM_TOKEN" ]; then
  echo "错误：未设置 NPM_TOKEN 环境变量"
  echo "请运行: export NPM_TOKEN=你的令牌"
  exit 1
fi

# 构建并发布包到本地 registry
echo "使用 TOKEN 发布包到本地 registry..."
npm run deploy

# 恢复之前的代理设置（如果有）
if [ -n "$OLD_HTTP_PROXY" ]; then
  export http_proxy=$OLD_HTTP_PROXY
fi
if [ -n "$OLD_HTTPS_PROXY" ]; then
  export https_proxy=$OLD_HTTPS_PROXY
fi
if [ -n "$OLD_ALL_PROXY" ]; then
  export all_proxy=$OLD_ALL_PROXY
fi
