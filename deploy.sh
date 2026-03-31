#!/bin/bash
echo "=========================================="
echo "     一键部署 Ollama 大模型服务"
echo "=========================================="
echo "本脚本将自动安装 Docker 并启动 Ollama"
echo ""

# 检查 Docker 是否已安装
if ! command -v docker &> /dev/null; then
  echo "正在安装 Docker..."
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo usermod -aG docker $USER
  echo "Docker 安装完成"
else
  echo "Docker 已安装，跳过"
fi

# 拉取并运行 Ollama 容器
echo "正在启动 Ollama 容器..."
docker run -d --name ollama -p 11434:11434 --restart unless-stopped ollama/ollama

echo ""
echo "=========================================="
echo "部署成功！"
echo "API 地址: http://$(curl -s ifconfig.me):11434"
echo ""
echo "🎉 现在你可以使用 Ollama 提供的 AI 能力了！"
echo "推荐先拉取一个模型: docker exec -it ollama ollama pull llama3.2"
echo ""
echo "=========================================="
echo "💡 首次使用需要 API Key，推荐注册以下云厂商："
echo "👉 阿里云新人特惠：https://www.aliyun.com/activity"
echo "👉 腾讯云新人专区：https://cloud.tencent.com/act"
echo "（通过上述链接注册可享受新用户专属折扣）"
echo "=========================================="
