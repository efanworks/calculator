# @efanworks/calculator

A simple npm package that provides a sum function to add numbers or arrays of numbers.

## Installation

```bash
npm install @efanworks/calculator
```

## Usage

```javascript
// ESM/TypeScript
import { sum } from "@efanworks/calculator";

// CommonJS
const { sum } = require("@efanworks/calculator");

// Add numbers
sum(1, 2, 3, 4); // Returns 10

// Add arrays
sum([1, 2, 3]); // Returns 6

// Mixed numbers and arrays
sum(1, [2, 3], 4); // Returns 10

// Nested arrays
sum([1, [2, 3]], 4); // Returns 10
```

## API

### sum(...args)

Calculates the sum of numbers or arrays of numbers (including nested arrays).

- **Parameters**: `...args` - Numbers or arrays of numbers to sum
- **Returns**: The total sum as a number

## Development

### Build

```bash
npm run build
```

### Test

```bash
npm test
```

## 私有 Registry 发布指南

本项目配置为发布到私有的 `@efanworks` 域。

1. **启动本地 Registry**

   ```bash
   npm run registry:local
   ```

   服务将在 http://localhost:4873 上运行

2. **设置本地 Registry 访问令牌 (NPM TOKEN)**

   使用以下命令登录本地 Registry 并生成 token

   ```bash
   npm adduser --registry http://localhost:4873
   npm token create --registry http://localhost:4873
   ```

   注意：如果遇到代理问题（[代理问题排查指南](./PROXY_TROUBLESHOOTING.md)），代理软件可能未正确配置如何处理对本地服务的请求，已通过配置 .npmrc 解决该问题。

   获取令牌后，设置环境变量，或者创建一个本地配置文件（不提交到 Git）：

   为了安全地处理 NPM 令牌，**永远不要**在代码库中存储真实的 NPM Token

   ```bash
   # 在终端会话中设置环境变量：
   export NPM_TOKEN="your-actual-token"

   # or 创建配置文件并设置 NPM_TOKEN（推荐）
   echo 'export NPM_TOKEN="your-actual-token"' > ~/.npm_tokens
   chmod 600 ~/.npm_tokens  # 限制文件权限
   ```

3. **发布包**

   ```bash
   # 使用发布脚本（处理代理问题、读取本地～/.npm_tokens中的令牌）
   npm run deploy:local
   ```

## **轮换和撤销 Token**

定期轮换您的 Token 并在以下情况立即撤销：

- 您怀疑 Token 已泄露
- 团队成员离开或角色变更
- 项目安全审计后的最佳实践建议

## License

ISC
