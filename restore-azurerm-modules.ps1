#Uninstall AzureRM Modules
$modules = Get-InstalledModule `
    -Name Azure* `
    -ErrorAction SilentlyContinue

foreach ($m in $modules)
{
    Write-Output "Uninstalling $($m.Name)..."

    Uninstall-Module `
        -Name $m.Name `
        -AllVersions `
        -Force `
        -ErrorVariable ProcessError

    if (-Not $ProcessError)
    {
        Write-Output "$($m.Name) was successfully uninstalled.`n"
    }
}

# Installs AzureRM 5.2.0 from: <https://www.powershellgallery.com/packages/AzureRM/5.2.0>
$version = "5.2.0"

Set-PSRepository `
    -Name "PSGallery" `
    -SourceLocation "https://www.powershellgallery.com/api/v2/" `
    -InstallationPolicy Trusted

Write-Output "Installing AzureRM $version..."

Install-Module `
    -Name AzureRM `
    -RequiredVersion $version `
    -Force

Write-Output "AzureRM $version was installed successfully.`n"
