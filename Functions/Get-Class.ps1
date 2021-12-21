function Get-Class {
    $Classnumber = $null
    While (-not $Classnumber) {
        Write-Host 'What class do you want your NPC to be:' -ForegroundColor Green
        Write-Host '(1:  Alchemist)'
        Write-Host '(2:  Barbarian)'
        Write-Host '(3:  Bard)'
        Write-Host '(4:  Champion)'
        Write-Host '(5:  Cleric)'
        Write-Host '(6:  Druid)'
        Write-Host '7:  Fighter'
        Write-Host '(8:  Monk)'
        Write-Host '(9:  Ranger)'
        Write-Host '(10: Rogue)'
        Write-Host '(11: Sorcerer)'
        Write-Host '(12: Wizard)'
        $Classnumber = Read-Host -Prompt 'Your choice'
    }

    switch ($Classnumber) {
        '1' { $Global:Class = 'Alchemist' }
        '2' { $Global:Class = 'Barbarian' }
        '3' { $Global:Class = 'Bard' }
        '4' { $Global:Class = 'Champion' }
        '5' { $Global:Class = 'Cleric' }
        '6' { $Global:Class = 'Druid' }
        '7' { $Global:Class = 'Fighter' }
        '8' { $Global:Class = 'Monk' }
        '9' { $Global:Class = 'Ranger' }
        '10' { $Global:Class = 'Rogue' }
        '11' { $Global:Class = 'Sorcerer' }
        '12' { $Global:Class = 'Wizard' }
    }

    Return $Class
}
