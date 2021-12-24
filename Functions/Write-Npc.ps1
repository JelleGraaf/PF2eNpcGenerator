function Write-NPC {
    Clear-Host
    Write-Host
    Write-Host "+* NPC statistics *+" -ForegroundColor Magenta
    Write-Host "$($Ancestry.Name) $Class ($Subclass)                                                Humanoid $Level"
    Write-Host "Perception: $(Get-ProficiencyNumber -Proficiency $Global:Perception -BoundStat Wis)."
    Write-Host "Languages: $Global:Languages."
    Write-Host "Skills: " -NoNewline; Write-Skills
    Write-Host "STR: $($Stats.Str), DEX: $($Stats.Dex), CON: $($Stats.Con), INT: $($Stats.Int), WIS: $($Stats.Wis), CHA: $($Stats.Cha)"
    Write-Host ""
    Write-Host "------------------------------------------------------------------------------------------------"
    Write-Host "AC: <Not implemented yet>" -ForegroundColor DarkGray
    Write-Host " Fort: $FortSaveNumber, Ref: $ReflexSaveNumber, Will: $WillSaveNumber"
    Write-Host "HP: $Hp"
    Write-Host "------------------------------------------------------------------------------------------------"
    Write-Host "Speed: $Global:Speed"
    Write-Host "Melee: <Not implemented yet>" -ForegroundColor Darkgray
    Write-Host "Ranged: <Not implemented yet>" -ForegroundColor Darkgray
    #Write-Host "Melee: $MeleeWeapon $MeleeToHit. Damage: $MeleeWeaponDamageTotal" # TODO
    #Write-Host "Ranged: $RangedWeapon $RangedToHit. Damage: $RangedWeaponDamageTotal" # TODO
    Write-Host "------------------------------------------------------------------------------------------------"
    #Write-Host "Spells: $Spells" # TODO
    #Write-Host "------------------------------------------------------------------------------------------------"
    if ($Global:SpecialAbilities) {
        Write-Host "Special abilities:" -ForegroundColor Yellow
        Write-Host "$Global:SpecialAbilities"
        Write-Host "------------------------------------------------------------------------------------------------"
    }
    Write-Host "Ancestry feats" -ForegroundColor Yellow; $Global:AncestryFeats
    Write-Host "Class feats" -ForegroundColor Yellow; $Global:ClassFeats
    Write-Host "General feats" -ForegroundColor Yellow; $Global:GeneralFeats
    Write-Host "Skill feats" -ForegroundColor Yellow; $Global:SkillFeatsChosen
    Write-Host "------------------------------------------------------------------------------------------------"
    Write-Host "Background information"  -ForegroundColor Yellow
    Write-Host "Background: $($Background.Name)."
    Write-Host "Background story: <Not implemented yet>" -ForegroundColor Darkgray
    Write-Host "------------------------------------------------------------------------------------------------"
    Write-Host ""
    Write-Host ""
}