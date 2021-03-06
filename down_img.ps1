##set-executionpolicy remotesigned
#. "$PSScriptRoot\library1.ps1"
[System.Reflection.Assembly]::LoadWithPartialName("System")
[System.Reflection.Assembly]::LoadWithPartialName("System.Net")
$client = new-object System.Net.WebClient

Function DownLoadImg {
Param
    (
        $url
    )
    
    $dir = "c:\pic\";
    
    #$urt = WebUtility.UrlDecode($url);
    
    #获取到Host
    #$parttern0 = "^((http://)|(https://))?([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}(/)"
    #$url -match  $parttern0;
    #$host_name = $Matches[0];
    
    #获取文件名
    $parttern =  ".+/(.+)$"
    $url -match  $parttern;
    $file = $Matches[1];
    if($file -eq "")
    {
        $file = "1111.jpg";
    }
    
    #输出文件名
    Write-Host "文件名：$file ";
    
    #判断文件是否存在
    if(Test-Path $dir) {
       Write-Host "文件夹存在";
    } else{
         md $dir
        Write-Host "文件夹创建成功";
    }
    
    #下载图片
    $myUri =new-object System.Uri($url);
    $client.DownloadFile($myUri,"$dir\$file");
    
       
    Write-Host "图片下载成功：$dir\$file"
}

DownLoadImg -url "http://n.sinaimg.cn/news/1_img/upload/3ad618a7/66/w1000h666/20180521/3bv9-haturft7458170.jpg"