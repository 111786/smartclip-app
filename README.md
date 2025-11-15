# 智能剪辑助手 (简化版)

这是一个专为Android APK打包优化的简化版本智能剪辑应用。

## 项目特点

- 简化的用户界面，支持中文显示
- 基于Kivy框架开发
- 优化的APK构建配置
- 支持云端自动构建

## 本地运行

```bash
pip install -r requirements.txt
python main.py
```

## 云端构建APK

使用GitHub Actions自动构建APK：

1. 将项目推送到GitHub仓库
2. GitHub Actions会自动开始构建
3. 构建完成后在Actions页面下载APK

## 项目结构

```
smartclip_lite/
├── main.py              # 主程序文件
├── requirements.txt     # Python依赖列表
├── buildozer.spec       # Android构建配置
├── environment.yml      # Conda环境配置
├── .github/workflows/   # GitHub Actions配置
│   └── android.yml      # APK构建工作流
└── CLOUD_BUILD_INSTRUCTIONS.txt  # 云端构建说明
```

## 依赖说明

- Python 3.8
- Kivy 2.2.1
- KivyMD 1.1.1
- Buildozer (用于APK构建)

## 注意事项

- 首次构建需要下载Android SDK和NDK，可能需要较长时间
- 构建过程中请保持网络连接稳定
- 生成的APK文件位于`bin/`目录中