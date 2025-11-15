@echo off
chcp 65001 >nul
title 智能剪辑助手 - APK构建工具 (简化版)

echo ========================================
echo    智能剪辑助手APK构建工具 (简化版)
echo ========================================
echo.

REM 检查Python是否安装
python --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到Python，请先安装Python
    pause
    exit /b 1
)

echo [1/4] 检查环境...
echo [信息] Python已安装

REM 检查项目文件
if not exist "main.py" (
    echo [错误] 未找到main.py文件，请确保在正确的项目目录中运行此脚本
    pause
    exit /b 1
)

if not exist "buildozer.spec" (
    echo [错误] 未找到buildozer.spec文件
    pause
    exit /b 1
)

echo [2/4] 安装依赖...
pip install buildozer cython >nul 2>&1
if errorlevel 1 (
    echo [警告] 无法自动安装buildozer，可能需要手动安装
)

echo [3/4] 开始构建APK...
echo [信息] 构建过程可能需要较长时间，请耐心等待...
echo [信息] 首次构建需要下载Android SDK和NDK

buildozer android debug

REM 检查构建结果
if %errorlevel% equ 0 (
    echo [4/4] 构建完成
    echo.
    echo ========================================
    echo 🎉 APK构建成功！
    echo ========================================
    echo 📱 APK文件位置: bin\
    echo.
    echo 提示：将APK文件复制到手机上安装测试
) else (
    echo [4/4] 构建失败
    echo.
    echo ========================================
    echo ❌ APK构建失败
    echo ========================================
    echo.
    echo 常见问题解决方案：
    echo 1. 确保网络连接稳定
    echo 2. 检查磁盘空间是否充足（至少需要5GB）
    echo 3. 首次构建需要下载大量文件，请耐心等待
    echo 4. 如果问题持续存在，可以尝试使用云构建服务
)
echo.
pause