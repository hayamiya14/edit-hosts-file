<#
.SYNOPSIS
    Opens the system Hosts file in Notepad with elevation.

.DESCRIPTION
    The Edit-HostsFile function locates the Windows Hosts file (typically at
    C:\Windows\System32\drivers\etc\hosts) and opens it in Notepad running
    as Administrator. This allows modifying the Hosts file without manually
    navigating to the directory.

.EXAMPLE
    Import-Module Edit-HostsFile
    Edit-HostsFile

    Opens the Hosts file in Notepad (elevated). Alias 'ehf' can also be used:
    ehf

#>
function Edit-HostsFile {
    [Alias('ehf')]
    [CmdletBinding()]

    # Define the standard path to the Hosts file on Windows.
    $hostFilePath = 'C:\Windows\System32\drivers\etc\hosts'

    if (-not (Test-Path -LiteralPath $hostFilePath)) {
        Write-Error "Hosts file not found at path: $hostFilePath"
        return
    }

    Start-Process -FilePath 'notepad.exe' -ArgumentList $hostFilePath -Verb RunAs
}

Export-ModuleMember -Function 'Edit-HostsFile' -Alias 'ehf'
