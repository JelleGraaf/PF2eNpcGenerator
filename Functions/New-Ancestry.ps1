function New-Ancestry {
    # Import ancestry data
    $AncestryPsCustom = Get-Content .\Functions\Data\Ancestries\$($Global:Ancestry.Name).json | ConvertFrom-Json
    $AncestryPsCustom.psobject.properties | ForEach-Object { $GLobal:Ancestry[$_.Name] = $_.Value }
    
    # Adjust hit points
    $Global:Hp += [int]$Global:Ancestry.HP
    
    # Set size
    $Global:Size = $Global:Ancestry.Size
    
    # Set speed
    $Global:Speed = $Global:Ancestry.Speed

    # Apply ability boosts and flaws. We add the one free boost during class modification
    if ($Global:Ancestry.Abilityboosts -contains 'STR') { $Global:Stats.Str += 2 }
    if ($Global:Ancestry.Abilityboosts -contains 'CON') { $Global:Stats.Con += 2 }
    if ($Global:Ancestry.Abilityboosts -contains 'DEX') { $Global:Stats.Dex += 2 }
    if ($Global:Ancestry.Abilityboosts -contains 'INT') { $Global:Stats.Int += 2 }
    if ($Global:Ancestry.Abilityboosts -contains 'WIS') { $Global:Stats.Wis += 2 }
    if ($Global:Ancestry.Abilityboosts -contains 'CHA') { $Global:Stats.Cha += 2 }

    if ($Global:Ancestry -eq 'Human' -or $Global:Ancestry -eq 'Half-Elf' -or $Global:Ancestry -eq 'Half-Orc') {
        # One more free boost to assign. Let's do it random (not the primary stat), for lack of a better determination
        $Stat = @('STR', 'CON', 'DEX', 'INT', 'WIS', 'CHA') | Where-Object { $_ -ne $Global:PrimaryStat } | Get-Random
        $Global:Stats.$Stat += 2
    }

    if ($Global:Ancestry.Abilityflaw -contains 'STR') { $Global:Stats.Str -= 2 }
    if ($Global:Ancestry.Abilityflaw -contains 'CON') { $Global:Stats.Con -= 2 }
    if ($Global:Ancestry.Abilityflaw -contains 'DEX') { $Global:Stats.Dex -= 2 }
    if ($Global:Ancestry.Abilityflaw -contains 'INT') { $Global:Stats.Int -= 2 }
    if ($Global:Ancestry.Abilityflaw -contains 'WIS') { $Global:Stats.Wis -= 2 }
    if ($Global:Ancestry.Abilityflaw -contains 'CHA') { $Global:Stats.Cha -= 2 }

    # Add languages
    $Global:Languages += $Global:Ancestry.Languages

    # Add special abilities
    $Global:SpecialAbilities += $Global:Ancestry.SpecialAbilities

    # Add ancestry feats
    $Global:Ancestry['NumberOfAncestryFeats'] = [Math]::Floor([decimal](($Global:Level -1) / 4)) +1
}
