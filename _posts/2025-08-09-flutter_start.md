---
layout: post
title: 如何创建一个APP
description: 本篇文章将介绍一个APP项目是如何开始的，文章使用flutter框架进行项目的构建。
tag: Flutter
---

## 简介

移动APP作为我们生活中不可或缺的一部分，相信大家都想了解一下，一款APP是如何被程序员制作出来的吧。今天给大家带来了如何在自己的电脑上创建一个APP项目，并制作出一个APP安装包安装到自己的手机上。我们将使用目前流行的移动应用框架flutter，在Windows电脑上开发一款简单的Android移动APP。本教程使用的电脑环境如下：

- 操作系统：Windows11
- 浏览器：Edge
- 命令行工具：powershell

> 你可以使用Windows10及以上版本，浏览器选择电脑自带浏览器即可。

话不多说，咱就开始吧！

## 一、前置知识补充

本节是提供一些和本文有关的一些背景知识，意在帮助读者更好的理解后续的内容，如果你已经掌握本节介绍的相关知识，可以直接进入第二节。

### 1.flutter简介

![flutter](/images/posts/2025-08-08/各种各样的移动APP（flutter.cn）.png)

Flutter 是由 Google 开发的开源 UI 软件开发工具包（SDK）。它允许开发者使用单一的代码库，为多种平台构建高性能、美观的原生应用，包括：

- 移动端：​​ Android, iOS
- ​桌面端：​​ Windows, macOS, Linux
- Web 端：​​ Web 平台（支持 JavaScript 和 WebAssembly）

**核心特点**：

1. **​跨平台**：​​ “一次编写，处处运行”，显著提高开发效率。
2. **高性能**：​​ Flutter应用的发布版本在Android和iOS上都进行了提前（AOT, Ahead Of Time）编译，使Flutter在移动设备上可以高性能地运行。
3. **声明式 UI**：​​ 使用 Dart 语言，通过组合“Widget”（组件）树来构建用户界面，开发直观高效。Widget 分为无状态（Stateless）和有状态（Stateful）两种。
4. **丰富的 UI 组件**：​​ 提供两套遵循主流设计语言的精美组件库：Material Design（Google 风格）和 Cupertino（Apple iOS 风格），可在任一平台上使用。
5. **热重载**：​​ 快速迭代开发，代码更改后能立即在运行中的应用上看到效果，无需重启。
6. **开源与活跃社区**：​​ 拥有庞大的开发者社区和丰富的第三方包（通过 Pub 包管理器）。

### 2.powershell简介

PowerShell（包括Windows PowerShell和PowerShell Core）是微软公司开发的任务自动化和配置管理架构，由在.NET Framework和后来的.NET上构建的命令行界面壳层相关脚本语言组成。其窗口界面如图所示：

![powershell](/images/posts/2025-08-08/powershell.png)

使用powershell可以高效便捷地完成许多繁琐而又复杂的任务，下面介绍 了三种打开powershell窗口的方式：

**方式1：**通过运行命令打开

使用快捷键`win + r` 打开运行对话框，此时你可以在桌面的左下角看到一个窗口，如图所示：

![running](/images/posts/2025-08-08/running.png)

此时直接切换为英文输入法，输入单词`powershell`并回车：

![running2](/images/posts/2025-08-08/running2.png)

然后就会打开一个powershell窗口，如图所示：

![running3](/images/posts/2025-08-08/running3.png)

**方式2 使用快捷窗口打开：**

在桌面上使用快捷键`win+x` 调出快捷菜单如图所示：

![winx](/images/posts/2025-08-08/winx.png)

此时可以直接使用鼠标点击powershell选项打开powershell窗口，也可以按`i`键打开powershell窗口，如图所示：

![winx2](/images/posts/2025-08-08/winx2.png)

**方式3 在指定文件夹下打开powershell窗口：**

有时候我们需要在指定的文件夹下使用powershell（例如本文的第四节），此时我们就需要使用以下方式在指定文件夹在打开powershell窗口。

首先我们先打开目标文件夹，例如`下载`文件夹：

![shift](/images/posts/2025-08-08/shift.png)

然后按住`shift`键，同时鼠标右击文件夹空白处，在弹出的快捷菜单中点击在此处打开powershell窗口：

![shift2](/images/posts/2025-08-08/shift2.png)

便可以在指定文件夹下打开powershell窗口，如图所示：

![shift3](/images/posts/2025-08-08/shift3.png)

### 3.如何使用powershell

接下来将简要介绍如何使用powershell。

**窗口介绍：**

如图所示，powershell窗口的布局十分简洁，整个窗口由标题栏和命令行组成（命令行即输入命令的额区域）：
![learn_powershell](/images/posts/2025-08-08/learn_powershell.png)

**输入一个命令：**

打开powershell窗口后，我们可以将输入法切换为英文状态，然后直接输入命令，类似于记事本，我们可以在powershell窗口中输入直接输入以下命令：

```shell
echo "hello world"
```

如图所示：

![learn_powershell2](/images/posts/2025-08-08/learn_powershell2.png)

然按下回车键（Enter）,命令就会执行，同时我们可以在窗口中看到执行结果，如图所示：

![learn_powershell3](/images/posts/2025-08-08/learn_powershell3.png)

最后我们来了解一下如何在powershell窗口中粘贴命令，
现在我们选中以下命令，并按下快捷键`ctrl+c`：

```shell
echo "这是第一行命令"
Write-Host "这是第而二行命令" 
Write-Host "这是第三行命令" -ForegroundColor Red
```

然后再点击powershell窗口，按下快捷键`ctrl+v`，如图所示：

![learn_powershell4](/images/posts/2025-08-08/learn_powershell4.png)

此时并没有看到命令的执行结果，我们需要按下回车键，这时就可以看到结果了，如图所示：

![learn_powershell5](/images/posts/2025-08-08/learn_powershell5.png)

**注意：**有时候powershell窗口中并没有回到命令行状态，说明命令正在执行中，如图所示：

![learn_powershell6](/images/posts/2025-08-08/learn_powershell6.png)

好了，以上就是需要了解的背景知识，接下来我们将开始创建我们的第一个APP！

## 二、下载和安装flutter开发环境（复杂度☆☆☆）

### 1.下载flutter安装包并安装到电脑

首先我们需要按下快捷键`win+x`松开并按下`i`键打开powershell窗口，然后将以下特别长的命令粘贴到powershell窗口中：

```shell
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
```

**命令解释：**

- 首先会检测是否安装了7-zip因为后续的解压需要使用7z命令
- 如果安装了7-zip就继续执行后续步骤，否则就安装7-zip
- 然后从网络上下载flutter安装包，版本为3.13.0稳定版
- 下载完成的安装包 会保存到用户文件夹下
- 接着使用7z解压flutter安装包
- 解压后的flutter软件保存在`用户文件夹\flutter`文件夹中
- 最后将flutter添加到环境变量，并验证flutter是否可用

将命令粘贴到powershell窗口后，就会看到如下界面：

![install flutter](/images/posts/2025-08-08/install_flutter.png)

如果出现了以下情况，请点击是:

![install_7zip](/images/posts/2025-08-08/install_7zip.png)

所有命令执行完大约需要等待6分钟，当命令执行完之后，如果powershell窗口显示如下信息表示flutter安装完成：

![alt text](/images/posts/2025-08-08/install_flutter_finished.png)

此时你已经完成了本节50%的步骤了🙂

### 2.初始化flutter软件

接下来我们需要配置flutter，请继续在powershell窗口中粘贴以下命令：

```shell
[Environment]::SetEnvironmentVariable("PUB_HOSTED_URL", "https://pub.flutter-io.cn", "User")
[Environment]::SetEnvironmentVariable("FLUTTER_STORAGE_BASE_URL", "https://storage.flutter-io.cn", "User")
$env:PUB_HOSTED_URL = "https://pub.flutter-io.cn"
$env:FLUTTER_STORAGE_BASE_URL = "https://storage.flutter-io.cn"
flutter doctor
echo ''
```

如图：

![flutter_start](/images/posts/2025-08-08/flutter_start.png)

请等待几分钟，如果显示以下内容表示命令执行完成：

![flutt_start2](/images/posts/2025-08-08/flutter_start2.png)

我们可以查看滚动窗口查看更详细的信息，如果你暂时不想了解flutter的具体细节，可以进入下一节。

flutter输出的信息解释：

![flutter detail](/images/posts/2025-08-08/flutter_detail.png)

这里我们可以了解到如下信息：

- flutter的版本是3.13.0 stable
- flutter是安装在Windows操作系统上的
- Android toolchain 目前不可用
- Chrome开发环境 目前不可用
- Visual Studio 目前不可用
- Android Studio 没有安装
- Network resources的相关警告

其中值得注意的是`Android toolchain`和`Android Studio`,因为我们后续需要将我们的APP项目制作成Android安装包并安装在手机上，而实现以上功能就需要保证`Android toolchain`和`Android Studio`的配置正确，我们将在第四节继续讨论`Android toolchain`和`Android Studio`的配置内容。

其他问题并不影响flutter的使用，Network resources警告是因为国内网络的限制导致了flutter无法访问一些网站，这不是本文的讨论范围，感兴趣的伙伴可以去flutter.cn了解更多信息。

好了本节结束，接下来是比较轻松的部分，创建一个APP项目😄

## 三、创建一个APP项目（复杂度☆☆）

### 1.创建一个flutter项目

完成了flutter安装，我们接下来创建我们的第一个flutter APP项目。

在创建项目之前，我们需要准备一个文件夹，请根据你的使用习惯在你认为合适的地方创建一个存放flutter项目的文件夹吧。例如本文使用的是`C:\Users\yu\Documents\flutter_projects`

![flutter_project_dir](/images/posts/2025-08-08/flutter_project_dir.png)

我们在创建的flutter文件夹中，按住shift键，鼠标右击空白处，在弹出的快捷菜单中点击`在此处打开Powershell窗口` 如图所示：

![start powershell](/images/posts/2025-08-08/start_powershell.png)

在打开的powershell窗口中粘贴以下命令：

```shell
flutter create myapp1
cd myapp1
```

以上命令会创建一个名为myapp1的flutter项目，并进入到myapp1项目文件夹中，如图所示：

![myapp1 start](/images/posts/2025-08-08/myapp1_start.png)

如果你熟悉了以上两条命令，可以自己创建一个不同名称的项目然后继续后续的步骤。

我们可以看到flutter_projects文件夹中多了一个名为myapp1的文件夹，这便是myapp1项目文件保存的地方。

![myapp1 start 1](/images/posts/2025-08-08/myapp1_start1.png)

### 2.在Edge浏览器中查看我们的APP

接下来我们在浏览器中查看我们创建的APP是什么样的，我们继续在powershell窗口中粘贴以下命令命令：

```shell
flutter run
```
此时会出现以下界面，我们需要输入`Edge`所对应的序号，例如我这里是2，所以我就输入2：

![select device](/images/posts/2025-08-08/select_device.png)

等待几分钟，如果你看到了一个浏览器界面出现了一个如下图所示的解密，那么恭喜你，你已经完成了一个flutter项目的创建🎉

![web app](/images/posts/2025-08-08/web_app.png)

浏览器中显示的是一个flutter的demo APP，该APP实现了点击➕按钮就能让屏幕中间数字增大的功能。

当然，flutter的功能远不于此，你可以学习flutter的更多知识来创造一个你想要的APP！以下是我编写的一个flutter APP示例，你可以使用git克隆到本地。

```shell
https://github.com/zhuzilina/myapp1.git
```

## 四、配置Android环境（复杂度☆☆☆☆）

接下来的步骤稍微有一点复杂，如果你有足够的耐心，那就来吧💪

### 1.安装Android studio

请打开你的浏览器，在地址栏中粘贴以下链接并回车：

[https://developer.android.google.cn/studio?hl=zh-cn](https://developer.android.google.cn/studio?hl=zh-cn)

![android download](/images/posts/2025-08-08/android_download.png)

点击按钮“下载 Android Studio Narwhal 功能更新”

![android_download2](/images/posts/2025-08-08/android_download2.png)

然后会出现一个协议条款的窗口，滚动到协议文本末尾，勾选我已阅读并同意上述条款及条件，并点击下载按钮开始下载Android studio安装包：

![android_download3](/images/posts/2025-08-08/android_download3.png)

此时我们可以看到已经在下载Android studio的安装包了：

![android_download4](/images/posts/2025-08-08/android_download4.png)

下载完成后点击打开文件即可进入Android studio的安装程序,请点击`是`开始安装：

![android_install](/images/posts/2025-08-08/android_install.png)

然后一直点击next：

![android_install2](/images/posts/2025-08-08/android_install2.png)

直到这一步，点击install开始安装Android studio：

![android_install3](/images/posts/2025-08-08/android_install3.png)

然后等待1分钟，即可完成Android studio的安装，然后我们点击next：

![android_install4](/images/posts/2025-08-08/android_install4.png)

最后点击finish，完成Android studio的安装，同时Android studio会自动打开：

![android_install5](/images/posts/2025-08-08/android_install5.png)

打开Android studio后，首先会出现第一个窗口，点击don't  send：

![android_start](/images/posts/2025-08-08/android_start.png)

此时会出现一个弹窗，点击 cancel：

![android_start2](/images/posts/2025-08-08/android_start2.png)

然后一直点击next：

![android_start3](/images/posts/2025-08-08/android_start3.png)

直到不能点击时，先点击accept接受协议，再点击next：

![android_start4](/images/posts/2025-08-08/android_start4.png)

此时会开始下载Android sdk文件，请等待几分钟，当finish按钮高亮时，点击finish，进入Android studio：

![android_start5](/images/posts/2025-08-08/android_start5.png)

点击Android studio窗口中的⚙️按钮：

![tool_chain](/images/posts/2025-08-08/tool_chain.png)

然后点击settings选项进入Android studio配置窗口：

![tool_chain2](/images/posts/2025-08-08/tool_chain2.png)

在Android studio配置窗口中点击languages & Frameworks选项：

![tool_chain3](/images/posts/2025-08-08/tool_chain3.png)

接着在详情栏中点击Android sdk：

![tool_chain4](/images/posts/2025-08-08/tool_chain4.png)

在Android sdk配置栏中点击sdk tools选项：

![tool_chain5](/images/posts/2025-08-08/tool_chain5.png)

然后在sdk tools配置栏中勾选Android sdk command-line tools并点击ok按钮完成Android studio的配置：

![tool_chain6](/images/posts/2025-08-08/tool_chain6.png)

在弹出的确认提示框中点击ok：

![tool_chain7](/images/posts/2025-08-08/tool_chain7.png)

此时Android studio会下载依赖文件，需要几分钟的时间，当finish按钮高亮时点击finish按钮关闭窗口：

![tool_chain8](/images/posts/2025-08-08/tool_chain8.png)

至此我们已经完成了Android配置的30%，接下来的操作需要回到原来的powershell窗口中，如果你关闭了刚才的powershell窗口，请打开flutter项目的文件夹然后使用第三节的方法打开一个powershell窗口。

例如我的flutter项目是myapp1，那么我需要打开myapp1这一文件夹，在该文件夹下打开powershell窗口：

![tool_chain9](/images/posts/2025-08-08/tool_chain9.png)

### 2.配置Android许可

回到powershell窗口，然后粘贴以下命令：

```shell
flutter doctor
```

此时会出现一个弹窗，请点击允许：

![tool_chain10](/images/posts/2025-08-08/tool_chain10.png)

然后继续粘贴以下命令：

```shell
flutter doctor --android-licenses
```

此时powershell窗口中会询问是否同意选项：

![tool_chain11](/images/posts/2025-08-08/tool_chain11.png)

输入英文字符`y`并回车，剩下的6个询问是否同意选项也是这样的操作:

![tool_chain12](/images/posts/2025-08-08/tool_chain12.png)

当所有的选项都输入y并回车之后，即完成了Android许可的配置：

![tool_chain13](/images/posts/2025-08-08/tool_chain13.png)

至此Android的配置已经完成了70%，最后一步我们需要配置gradle，我们将继续在powershell窗口中完成后续操作。

### 3.配置gradle

在项目文件夹下打开的powershell窗口中粘贴以下命令：

```shell
# 修改android\build.gradle
$filePath = "android\build.gradle"
$content = Get-Content -Path $filePath -Raw
# 替换 buildscript.repositories
$buildRepos = @'
repositories {
    maven { url "https://maven.aliyun.com/repository/gradle-plugin" }
    maven { url "https://maven.aliyun.com/repository/public" }
    google()
    mavenCentral()
}
'@
$content = $content -replace '(?s)(buildscript\s*\{.*?repositories\s*\{).*?(\})', "`$1$buildRepos`n    `$2"
# 替换 allprojects.repositories
$allRepos = @'
repositories {
    maven { url 'https://maven.aliyun.com/repository/google' }
    maven { url 'https://maven.aliyun.com/repository/public' }
    google()
    mavenCentral()
    maven { url "https://storage.flutter-io.cn/download.flutter.io" }
}
'@
$content = $content -replace '(?s)(allprojects\s*\{.*?repositories\s*\{).*?(\})', "`$1$allRepos`n    `$2"
# 写入文件并保持原有编码和换行符
Set-Content -Path $filePath -Value $content -NoNewline
# 修改android\gradle\wrapper\gradle-wrapper.properties
$wrapperPath = "android\gradle\wrapper\gradle-wrapper.properties"
$newUrl = 'distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-8.5-all.zip'
# 使用正则表达式替换 distributionUrl 行
$content = Get-Content -Path $wrapperPath
$modifiedContent = foreach ($line in $content) {
    if ($line -match '^distributionUrl=') {
        Write-Host "替换原始版本: $line" -ForegroundColor Yellow
        $newUrl
    } else {
        $line
    }
}
Set-Content -Path $wrapperPath -Value $modifiedContent
echo ''
```

如果powershell窗口显示以下内容表示配置完成：

![gradle](/images/posts/2025-08-08/gradle.png)

现在已经完成了gradle的配置步骤，恭喜你完成了所有的配置，下一节我们将讨论如何创建一个apk文件,并在手机上安装该APP。

## 五、从项目代码到APP安装包（复杂度☆☆）

### 1.编译apk文件

在刚才的powershell窗口中粘贴以下命令（确保是在项目文件夹在打开的powershell窗口）：

```shell
flutter build apk --release
```

这里需要等待一定的时间，大概是6分钟左右，当powershell窗口显示以下内容时表示apk文件编译完成：

Running Gradle task 'assembleRelease'...                          326.7s
√  Built build\app\outputs\flutter-apk\app-release.apk (17.3MB).

如图：

![apk](/images/posts/2025-08-08/apk.png)

如果这一步顺利完成了，那么恭喜你，你已经拥有了一个APP 安装包了🎉

### 2.在手机上安装我们创建的APP

最后我们在手机上安装我们的APP😄

在原来的powershell窗口中粘贴以下命令：

```shell
Copy-Item -Path "build\app\outputs\flutter-apk\app-release.apk" -Destination "~\desktop\myapp1.apk"
```

执行完以上命令后，我们可以在桌面上看到一个名为myapp1.apk的文件：

![apk2](/images/posts/2025-08-08/apk2.png)

这便是我们后续需要安装的apk软件啦！
你可以通过你擅长的文件传输方式将该文件发送到你的手机上，进行安装。我这里使用QQ

![qq_file](/images/posts/2025-08-08/qq_file.png)

apk文件通过QQ传输后会自动在文件名末尾加上`.1`:

![file_apk_1](/images/posts/2025-08-08/file_apk_1.jpg)

我们需要手动重命名将末尾的`.1`删去，然后点击该文件即可进入APP安装界面，由于不同的设备安装apk的方式不同，这里就不再讨论，你可以去网上搜索一下自己的设备是如何安装apk文件的。

最后安装完成的APP，打开后的效果如图：

![app](/images/posts/2025-08-08/app.jpg)

## 六、结语

本文介绍了如何通过flutter框架搭建自己的APP项目`myapp1`，由于文章的目标是如何创建一个APP，侧重于整体的流程，所以并没有详细介绍如何编写和调试APP的项目文件。

flutter是一个强大的开源前端开源框架，其理念是一套代码支持全平台，也就是说编写一套flutter项目代码，我就可以将我的应用发布到Android手机、iPhone、浏览器、Windows电脑、Linux电脑和Mac电脑，由此可见其兼容性十分广泛。

相信通过本文，你对flutter有了一些认识，如果你对flutter感兴趣的话，欢迎加入flutter的世界，去使用flutter创造一款属于你的APP吧，你一定会爱上这一过程的🙂

> **一些关于flutter在国内部署的个人观点**
>
> 由于国内网络的限制，部署flutter项目有时候会十分困难，我认为其中最难的部分就是flutter软件和开发Android需要用到的gradle软件的网络配置问题。对于不了解这些的开发者来说，修改一些各种各样的配置文件确实是一件头疼的事情。目前解决网络相关的问题，我认为最简单最高效的方式是使用代理网络，这样做不仅可以不做任何修改，同时能够实时更新flutter软件，大大提升了开发效率。本文使用的是修改软件配置文件的方法，解决flutter访问网络的问题的方法还有很多，如果你有其他的方法，那么欢迎你的分享。
