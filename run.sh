#!/bin/bash
# agents-radar 本地运行脚本
# 使用智谱GLM模型

set -e

# 加载nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 使用Node.js 22
nvm use 22

# 配置环境变量
export LLM_PROVIDER="openai"
export OPENAI_API_KEY="960dca9de1be4e3a800d8bb8df16a97a.idnFecENCsy2BMto"
export OPENAI_BASE_URL="https://open.bigmodel.cn/api/paas/v4/"
export OPENAI_MODEL="glm-4.7-flash"
export GITHUB_TOKEN="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"

echo "=========================================="
echo "agents-radar 本地运行"
echo "=========================================="
echo "LLM Provider: $LLM_PROVIDER"
echo "Model: $OPENAI_MODEL"
echo "GitHub Token: 已配置"
echo "=========================================="
echo ""

# 运行程序
pnpm start
