function Write-NPC {
    Write-Host
    Write-Host "GRAND TOTAL:" -ForegroundColor Cyan
    Write-Host "Ancestry: $($Ancestry.Name). Class: $Class ($Subclass). Level: $Level. Hit points: $Hp." -ForegroundColor Yellow
    Write-Host "Stats: STR: $($Stats.Str), DEX: $($Stats.Dex), CON: $($Stats.Con), INT: $($Stats.Int), WIS: $($Stats.Wis), CHA: $($Stats.Cha)" -ForegroundColor Yellow
    Write-Host "Background: $($Background.Name)." -ForegroundColor Yellow
    Write-Host "Skills:" -ForegroundColor Yellow; Write-Skills
    Write-Host "Languages:" -ForegroundColor Yellow; $Global:Languages
    Write-Host "Saving throws: Fort: $FortSaveNumber. Ref: $RefSaveNumber. Will: $WillSaveNumber."
    Write-Host "Class DC: $ClassDcNumber"
    Write-Host "Special abilities:" -ForegroundColor Yellow; $Global:SpecialAbilities
    Write-Host "Ancestry feats:" -ForegroundColor Yellow; $Global:AncestryFeats
    Write-Host "Class feats:" -ForegroundColor Yellow; $Global:ClassFeats
    Write-Host "General feats:" -ForegroundColor Yellow; $Global:GeneralFeats
    Write-Host "Skill feats:" -ForegroundColor Yellow; $Global:SkillFeats
        
    
    #Write-Host "THIS IS IT!" -ForegroundColor Red
    #Write-Host "$Ancestry $Class                                                                  Humanoid $Level"
    #Write-Host "Perception: $Perception."
    #Write-Host "Languages: $Languages."
    #Write-Host "Skills: $Skills"
    #Write-Host "STR: $($Stats.Str), DEX: $($Stats.Dex), CON: $($Stats.Con), INT: $($Stats.Int), WIS: $($Stats.Wis), CHA: $($Stats.Cha)"
    #Write-Host ""
    #Write-Host "------------------------------------------------------------------------------------------------"
    #Write-Host "AC: $AC; Fort: $FortSave, Ref: $ReflexSave, Will: $WillSave"
    #Write-Host "HP: $HitPoints"
    #Write-Host ""
    #Write-Host "------------------------------------------------------------------------------------------------"
    #Write-Host "Speed: $Speed"
    #Write-Host "Melee: $MeleeWeapon $MeleeToHit. Damage: $MeleeWeaponDamageTotal"
    #Write-Host "Ranged: $RangedWeapon $RangedToHit. Damage: $RangedWeaponDamageTotal"
    #Write-Host ""
    #Write-Host "------------------------------------------------------------------------------------------------"
    #Write-Host "Spells: $Spells"
    #Write-Host ""
    #Write-Host "------------------------------------------------------------------------------------------------"
    #Write-Host "Background information"
    #Write-Host "Background: $($Background.Name)."
    #Write-Host "------------------------------------------------------------------------------------------------"
    #Write-Host ""
    #Write-Host ""
    #Write-Host ""
    #Write-Host ""
}