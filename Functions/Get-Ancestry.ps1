function Get-Ancestry {
    $Ancestrynumber = $null
    While (-not $Ancestrynumber) {
        Write-Host 'What race do you want your NPC to be:' -ForegroundColor Green
        Write-Host '1: Dwarf'
        Write-Host '2: Elf'
        Write-Host '3: Gnome'
        Write-Host '4: Goblin'
        Write-Host ('5: Half-Elf')
        Write-Host ('6: Half-Orc')
        Write-Host '7: Halfling'
        Write-Host '8: Human'
        $Ancestrynumber = Read-Host -Prompt 'Your choice'
    }

    switch ($Ancestrynumber) {
        '1' { $Ancestry = 'Dwarf' }
        '2' { $Ancestry = 'Elf' }
        '3' { $Ancestry = 'Gnome' }
        '4' { $Ancestry = 'Goblin' }
        '5' { $Ancestry = 'Half-Elf' }
        '6' { $Ancestry = 'Half-Orc' }
        '7' { $Ancestry = 'Halfling' }
        '8' { $Ancestry = 'Human' }
    }

    Return $Ancestry
}
