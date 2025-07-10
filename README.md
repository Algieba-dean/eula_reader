# 🎭 诙谐搞笑用户协议解读器

一个将枯燥法律条文转换为诙谐易懂解读的网页应用，让用户在娱乐中理解用户协议的真实含义。

## ⚠️ 重要声明

**本应用仅供娱乐参考，不构成任何法律建议。请以原文为准，如需法律咨询请寻求专业律师帮助。**

## 🚀 功能特点

- 📄 **多格式支持**：支持PDF、DOC、TXT格式的用户协议文档
- 🤖 **智能解析**：基于spaCy的法律条款自动识别
- 😄 **搞笑解读**：将严肃条文转换为诙谐易懂的解释
- 📊 **对比展示**：原文与解读内容左右对照显示
- ⚖️ **风险防控**：完善的法律免责和风险提示机制

## 🛠️ 技术栈

### 后端
- **FastAPI** - 高性能Web框架
- **SQLAlchemy** - ORM数据库操作
- **spaCy** - 自然语言处理
- **SQLite** - 轻量级数据库

### 前端
- **Vue.js 3** - 现代前端框架
- **Bootstrap 5** - 响应式UI组件库
- **Axios** - HTTP客户端

## 📁 项目结构

```
no_responsibility/
├── backend/                 # 后端代码
│   ├── api/                # API路由
│   ├── core/               # 核心配置
│   ├── database/           # 数据库相关
│   ├── models/             # 数据模型
│   ├── services/           # 业务逻辑
│   ├── nlp/                # NLP处理
│   └── utils/              # 工具函数
├── frontend/               # 前端代码
│   ├── src/
│   │   ├── components/     # Vue组件
│   │   ├── views/          # 页面视图
│   │   ├── store/          # 状态管理
│   │   └── api/            # API客户端
├── tests/                  # 测试代码
├── docs/                   # 项目文档
└── deployment/             # 部署配置

```

## 🚀 快速开始

### 环境要求

- Python 3.8+
- Node.js 16+
- Docker (可选)

### 开发环境设置

1. **克隆项目**
```bash
git clone <repository-url>
cd no_responsibility
```

2. **后端设置**
```bash
# 创建虚拟环境
python -m venv venv
source venv/bin/activate  # Linux/Mac
# 或 venv\Scripts\activate  # Windows

# 安装依赖
pip install -r requirements.txt

# 下载spaCy语言模型
python -m spacy download zh_core_web_sm
python -m spacy download en_core_web_sm

# 初始化数据库
alembic upgrade head
```

3. **前端设置**
```bash
cd frontend
npm install
```

4. **Docker方式启动**
```bash
docker-compose up -d
```

### 运行项目

1. **后端服务**
```bash
cd backend
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

2. **前端服务**
```bash
cd frontend
npm run dev
```

3. **访问应用**
- 前端页面：http://localhost:3000
- API文档：http://localhost:8000/docs

## 🧪 测试

```bash
# 运行后端测试
pytest tests/

# 运行前端测试
cd frontend && npm run test
```

## 📝 开发指南

### 代码规范

- Python代码使用Black格式化
- 遵循flake8代码检查标准
- 提交前自动运行pre-commit hooks
- 所有函数需要类型注解

### 提交规范

- feat: 新功能
- fix: bug修复
- docs: 文档更新
- style: 代码格式调整
- refactor: 代码重构
- test: 测试相关

## 🚀 部署

### 生产环境部署

```bash
# 构建Docker镜像
docker-compose -f deployment/production.yml up -d
```

## 📄 许可证

MIT License

## 🤝 贡献

欢迎提交Issue和Pull Request！

---

**再次提醒：本应用仅供娱乐，不提供法律建议！** 🎭 