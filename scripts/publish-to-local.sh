#!/bin/zsh

# 本脚本演示如何安全地设置 TOKEN 并发布包

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
npm publish
