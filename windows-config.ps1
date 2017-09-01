Install-Module oh-my-posh
Install-Module posh-git

"Import-Module 'Oh-My-Posh' -DisableNameChecking -NoClobber`n" >> $PROFILE


Install-PackageProvider ChocolateyGet # VSCode fails if chocolatey provider is used
Import-PackageProvider ChocolateyGet

$basicPackages = @(
    'nvidia-display-driver',
    # basic
    '7zip', 
    'PDFXChangeViewer',
    'foobar2000',
    'teamviewer',
    # IM
    'skype', 
    'telegram',
    # browser
    'GoogleChrome'
)

$toolPackages = @(
    'Far',
    'git',
    'kdiff3',
    'gitextensions'
)

$devPackages = @(
    'dotPeek',
    'dotnetcore-sdk',
    'nodejs',
    'anaconda3',
    # IDE
    'VisualStudioCode',
    'VisualStudio2017Community'
)

function Install-PackageFromChoco {
    [CmdletBinding()] 
    param([string[]]$packages)

    Install-Package $packages -ProviderName ChocolateyGet
}

Install-PackageFromChoco $basicPackages -Confirm:$false
Install-PackageFromChoco $toolPackages -Confirm:$false
Install-PackageFromChoco $devPackages -Confirm:$false
