Set-ExecutionPolicy -Scope CurrentUser Unrestricted

Invoke-Expression (&starship init powershell)

# functions

function Set-VsCmd
{
    param(
        [parameter(Mandatory=$true, HelpMessage="Enter VS version as 2017, 2019")]
        [ValidateSet("2017","2019")]
        [System.String]$version,
        [parameter(Mandatory=$true, HelpMessage="Enter VS level as P(Proffesional), E(Enterprise)")]
        [ValidateSet("P","E")]
        [System.String]$level
    )
    $VS_LEVEL = @{ P = "Proffesional"; E = "Enterprise" }

    $targetDir = "c:\Program Files (x86)\Microsoft Visual Studio\$($version)\$($VS_LEVEL[$level])\Common7\Tools"
    $vcvars = "VsMSBuildCmd.bat"

  
    if (!(Test-Path (Join-Path $targetDir $vcvars))) {
        "Error: Visual Studio $version not installed"
        return
    }
    Push-Location $targetDir
    cmd /c $vcvars + "&set" |
    ForEach-Object {
      if ($_ -match "(.*?)=(.*)") {
        Set-Item -force -path "ENV:\$($matches[1])" -value "$($matches[2])"
      }
    }
    Pop-Location
    write-host "`nVisual Studio $version Command Prompt variables set." -ForegroundColor Yellow
}

function Set-Tools-Path
{
    $VSTOOLSPATH = "C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\x64"
    $ENV:PATH="$ENV:PATH;$VSTOOLSPATH"
}


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
