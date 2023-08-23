Try {
    $Object = @"
      $env:inputs
"@ | ConvertFrom-Json

    $Object.PSObject.Properties | ForEach-Object {
        if ($PSItem.Value) {
            $Value = $PSItem.Value -replace '\r*\n', ' '
        }
        else {
            $Value = $null
        }
        "$($PSItem.Name)=$Value" >> $env:BASH_ENV
    }

    Write-Host $env:BASH_ENV
}
Catch {
    throw $_.Exception.Message
}