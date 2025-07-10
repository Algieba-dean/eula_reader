# 开发指南

## 项目概述

诙谐搞笑用户协议解读器是一个将严肃的法律条文转换为诙谐易懂解读的网页应用。

## 开发环境设置

### 1. 克隆项目并初始化

```bash
git clone <repository-url>
cd no_responsibility
```

### 2. 后端环境设置

```bash
# 创建虚拟环境
python -m venv venv

# 激活虚拟环境
# Windows
venv\Scripts\activate
# Linux/Mac
source venv/bin/activate

# 安装依赖
pip install -r requirements.txt

# 下载spaCy语言模型
python -m spacy download zh_core_web_sm
python -m spacy download en_core_web_sm

# 设置pre-commit hooks
pre-commit install
```

### 3. 前端环境设置

```bash
cd frontend
npm install
```

### 4. 环境变量配置

```bash
# 复制环境变量模板
cp env.example .env

# 编辑.env文件，设置必要的配置项
```

## 项目结构说明

```
no_responsibility/
├── backend/                 # 后端Python代码
│   ├── api/                # API路由定义
│   │   └── v1/            # API版本1
│   ├── core/               # 核心配置和设置
│   ├── database/           # 数据库连接和操作
│   ├── models/             # SQLAlchemy数据模型
│   ├── services/           # 业务逻辑服务
│   ├── nlp/                # NLP文本处理
│   └── utils/              # 工具函数
├── frontend/               # 前端Vue.js代码
│   └── src/
│       ├── components/     # Vue组件
│       ├── views/          # 页面视图
│       ├── store/          # 状态管理
│       └── api/            # API客户端
├── tests/                  # 测试代码
│   ├── unit/              # 单元测试
│   └── integration/       # 集成测试
├── docs/                   # 项目文档
└── deployment/             # 部署配置
```

## 开发工作流

### 1. 创建功能分支

```bash
git checkout -b feature/feature-name
```

### 2. 开发过程

- 编写代码
- 运行测试：`make test`
- 格式化代码：`make format`
- 检查代码质量：`make lint`

### 3. 提交代码

```bash
git add .
git commit -m "feat: add new feature"
```

提交信息格式：
- `feat:` 新功能
- `fix:` bug修复
- `docs:` 文档更新
- `style:` 代码格式调整
- `refactor:` 代码重构
- `test:` 测试相关

### 4. 推送和合并

```bash
git push origin feature/feature-name
# 创建Pull Request
```

## 代码规范

### Python代码规范

- 使用Black进行代码格式化（行长度88字符）
- 使用flake8进行代码检查
- 使用isort进行import排序
- 所有函数需要类型注解
- 编写docstring文档

```python
def process_text(text: str, language: str = "zh") -> Dict[str, Any]:
    """
    处理输入文本并提取关键信息。
    
    Args:
        text: 待处理的文本
        language: 语言代码，默认为中文
        
    Returns:
        包含处理结果的字典
    """
    pass
```

### Vue.js代码规范

- 使用Composition API
- 组件名使用PascalCase
- 使用TypeScript类型注解
- 使用Prettier进行代码格式化

## 测试策略

### 后端测试

```bash
# 运行所有测试
pytest

# 运行单元测试
pytest tests/unit/

# 运行集成测试
pytest tests/integration/

# 测试覆盖率
pytest --cov=backend tests/
```

### 前端测试

```bash
cd frontend

# 运行单元测试
npm run test

# 运行e2e测试
npm run test:e2e
```

## 常用命令

### 使用Makefile

```bash
make help         # 查看所有可用命令
make install      # 安装所有依赖
make dev          # 启动开发服务器
make test         # 运行测试
make format       # 格式化代码
make lint         # 代码检查
make clean        # 清理临时文件
```

### Docker开发

```bash
# 构建并启动所有服务
docker-compose up --build

# 后台运行
docker-compose up -d

# 停止服务
docker-compose down

# 查看日志
docker-compose logs -f backend
```

## 调试技巧

### 后端调试

1. 使用FastAPI的自动文档：`http://localhost:8000/docs`
2. 添加调试日志：
```python
import logging
logger = logging.getLogger(__name__)
logger.debug("Debug message")
```

### 前端调试

1. 使用Vue DevTools
2. 浏览器开发者工具
3. 控制台日志：
```javascript
console.log('Debug info:', data)
```

## 性能优化

### 后端优化

- 使用异步函数处理I/O操作
- 实现数据库查询优化
- 添加缓存层（Redis）
- 文件上传使用流式处理

### 前端优化

- 组件懒加载
- 图片优化和懒加载
- 代码分割
- 缓存策略

## 部署指南

### 开发环境

```bash
make dev
```

### 生产环境

```bash
# 使用Docker部署
docker-compose -f deployment/production.yml up -d
```

## 常见问题

### Q: spaCy模型下载失败
A: 可以手动下载模型文件，或使用国内镜像源

### Q: 前端依赖安装失败
A: 尝试清除npm缓存：`npm cache clean --force`

### Q: Docker构建失败
A: 检查Docker配置和网络连接

## 贡献指南

1. Fork项目
2. 创建功能分支
3. 提交更改
4. 创建Pull Request
5. 代码审查
6. 合并到主分支

---

有问题请查看[项目文档](../README.md)或提交Issue。 