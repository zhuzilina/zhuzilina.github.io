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
