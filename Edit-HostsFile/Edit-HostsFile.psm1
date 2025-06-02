function Edit-HostsFile {
    [Alias('ehf')]
    [CmdletBinding()]
    param()

    $hostFilePath = 'C:\Windows\System32\drivers\etc\hosts'

    if (-not (Test-Path -LiteralPath $hostFilePath)) {
        Write-Error "hosts file not found at path: $EnvFile"
        Return
    }
    Start-Process notepad $hostFilePath -Verb RunAs
}

Export-ModuleMember -Function 'Edit-HostsFile' -Alias 'ehf'
