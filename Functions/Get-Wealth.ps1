function Get-Wealth {
    $Wealthnumber = $null
    While (-not $Wealthnumber) {
        Write-Host 'How wealthy do you want your NPC to be (comes back in gold and (magic) items):' -ForegroundColor Green
        Write-Host '(1:  Low)'
        Write-Host '(2:  Average)'
        Write-Host '(3:  High)'
        $Wealthnumber = Read-Host -Prompt 'Your choice'
    }

    switch ($Wealthnumber) {
        '1' { $Wealth = 'low' }
        '2' { $Wealth = 'average' }
        '3' { $Wealth = 'high' }
    }

    Return $Wealth
}
