# 代理问题排查指南

## 可能遇到的代理相关问题

在使用本地 Verdaccio 私有 registry 时，如果您的系统设置了代理，可能会遇到以下问题：

1. **连接错误** - 502 Bad Gateway
2. **认证失败** - 无法登录或发布包
3. **超时问题** - 请求长时间无响应

## 代理冲突解决方案

### 检查系统代理设置

```bash
# 检查终端环境变量
env | grep -i proxy

# 检查系统代理设置（macOS）
networksetup -getwebproxy Wi-Fi
networksetup -getsecurewebproxy Wi-Fi
```

### 临时禁用代理

在命令行操作前临时禁用代理：

```bash
# 清除所有代理环境变量
unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY all_proxy ALL_PROXY
```

### 针对 npm 特别设置

在 `.npmrc` 文件中特别配置不使用代理：

```properties
# 添加到 .npmrc
noproxy=localhost,127.0.0.1,::1
```

或使用命令配置：

```bash
npm config set proxy null
npm config set https-proxy null
npm config set noproxy "localhost,127.0.0.1,::1"
```

### 在脚本中处理代理

我们已经在 `scripts/publish-to-local.sh` 脚本中添加了自动处理代理的功能，该脚本会：

1. 保存当前代理设置
2. 临时禁用所有代理
3. 执行发布操作
4. 恢复原始代理设置

执行该脚本可避免代理导致的问题：

```bash
./scripts/publish-to-local.sh
```

## 系统级代理管理

### macOS

```bash
# 禁用 HTTP 代理
networksetup -setwebproxystate Wi-Fi off

# 禁用 HTTPS 代理
networksetup -setsecurewebproxystate Wi-Fi off
```

### 配置文件中的代理设置

检查以下文件是否包含代理设置：

- `~/.zshrc`
- `~/.bashrc`
- `~/.bash_profile`
- `~/.profile`

如需永久移除，请编辑这些文件并删除相关设置行。
