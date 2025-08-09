# 检测系统是否安装7-zip
function Get-7ZipPath {
    $regPath = @(
        'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\7-Zip'
        'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\7-Zip'
    )
    foreach ($path in $regPath) {
        if (Test-Path -Path $path) {
            $regItem = Get-ItemProperty -Path $path
            if ($regItem.InstallLocation) {
                return $regItem.InstallLocation.TrimEnd('\')
            }
        }
    }
    # 检查默认安装路径
    $possiblePaths = @(
        "${env:ProgramFiles}\7-Zip",
        "${env:ProgramFiles(x86)}\7-Zip",
        "$env:LOCALAPPDATA\Programs\7-Zip"
    )
    foreach ($folder in $possiblePaths) {
        $exePath = Join-Path $folder "7z.exe"
        if (Test-Path $exePath -PathType Leaf) {
            return $folder
        }
    }
    return $null
}
# 检测7-zip
$7zipPath = Get-7ZipPath
if ($null -eq $7zipPath) {
    Write-Host "未检测到 7-Zip，尝试下载并安装..." -ForegroundColor Yellow
    # 下载安装程序
    $url = "https://mirrors.nju.edu.cn/7-zip/7z2501-x64.exe"
    $installer = Join-Path $env:TEMP "7z-installer.exe"
    try {
        Invoke-WebRequest -Uri $url -OutFile $installer
        Write-Host "下载完成，开始静默安装..." -ForegroundColor Cyan
        # 静默安装
        Start-Process -FilePath $installer -ArgumentList "/S" -Wait
        # 获取默认安装路径
        $7zipPath = "${env:ProgramFiles}\7-Zip"
        Write-Host "7-Zip 安装完成" -ForegroundColor Green
    }
    catch {
        Write-Host "安装失败: $_" -ForegroundColor Red
        exit 1
    }finally {
        # 清理安装文件
        if (Test-Path $installer) {
            Remove-Item $installer -Force
        }
    }  
}
# 将7z添加到当前会话环境变量
$7zExe = Join-Path $7zipPath "7z.exe"
if (-not ($env:Path -split ';' -contains $7zipPath)) {
    $env:Path += ";$7zipPath"
    Write-Host "已将 7-Zip 路径添加到当前会话: $7zipPath" -ForegroundColor Cyan
}
# 验证7z可用性
if (-not (Test-Path $7zExe -PathType Leaf)) {
    Write-Host "错误: 7z.exe 未找到，无法继续" -ForegroundColor Red
    exit 1
}
# 下载flutter安装包
$flutterZip = Join-Path $HOME "flutter_windows_3.13.0-stable.zip"
Write-Host "开始下载 Flutter SDK..." -ForegroundColor Cyan
try {
    Import-Module BitsTransfer -ErrorAction Stop
    Start-BitsTransfer `
        -Source "https://storage.flutter-io.cn/flutter_infra_release/releases/stable/windows/flutter_windows_3.13.0-stable.zip" `
        -Destination $flutterZip `
        -TransferType Download `
        -ErrorAction Stop
    Write-Host "Flutter SDK 下载完成" -ForegroundColor Green
}
catch {
    Write-Host "下载失败: $_" -ForegroundColor Red
    exit 1
}
# 使用7z解压flutter安装包
Write-Host "开始解压 Flutter SDK..." -ForegroundColor Cyan
try {
    & $7zExe x "$flutterZip" "-o$HOME" -y
    if ($LASTEXITCODE -ne 0) {
        throw "解压失败，7z返回代码: $LASTEXITCODE"
    }
    Write-Host "解压完成" -ForegroundColor Green
}
catch {
    Write-Host "解压失败: $_" -ForegroundColor Red
    exit 1
}finally {
    # 删除安装包
    if (Test-Path $flutterZip) {
        Remove-Item $flutterZip -Force
        Write-Host "已清理安装包" -ForegroundColor DarkGray
    }
}
# 获取当前文件夹的完整路径
$currentDir = $HOME
# 构建目标路径 (flutter\bin)
$flutterPath = Join-Path $currentDir "flutter\bin"
# 将flutter添加到环境变量
if (-not ($env:PATH -split ';' -contains $flutterPath)) {
    # 更新注册表（用户级别）
    [Environment]::SetEnvironmentVariable(
        "PATH", 
        "$([Environment]::GetEnvironmentVariable('PATH', 'User'));$flutterPath", 
        'User'
    )
    # 更新当前会话
    $env:PATH += ";$flutterPath"
    Write-Host "已将 Flutter 添加到环境变量: $flutterPath" -ForegroundColor Cyan
} else {
    Write-Host "环境变量已包含 Flutter 路径: $flutterPath" -ForegroundColor Yellow
}
# 验证 flutter是否可用
$flutterExe = Join-Path $flutterPath "flutter.bat"
if (Test-Path $flutterExe -PathType Leaf) {
    Write-Host "Flutter 安装成功!" -ForegroundColor Green
} else {
    Write-Host "Flutter 安装失败" -ForegroundColor Red
    Write-Host "请检查路径: $flutterPath" -ForegroundColor Yellow
}
echo ''
