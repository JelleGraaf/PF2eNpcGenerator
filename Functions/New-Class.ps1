function New-Class {
    # Modify ability scores. Note that there are two bonuses, because we add the free ancestry boost here too.
    if ($Class -eq 'Alchemist') {
        $Global:Stats.Int += 4

    }
    if ($Class -eq 'Barbarian') {
        $Global:Stats.Str += 4
    
    }
    if ($Class -eq 'Bard') {
        $Global:Stats.Cha += 4
    
    }
    if ($Class -eq 'Champion') {
        $Global:Stats.Str += 4
    
    }
    if ($Subclass -eq 'Cloistered Cleric') {
        $Global:Stats.Wis += 4
    
    }
    if ($Subclass -eq 'Warpriest') {
        $Global:Stats.Wis += 2;
        $Global:Stats.Str += 2
    
    }
    if ($Class -eq 'Druid') {
        $Global:Stats.Wis += 4
    
    }
    if ($SubClass -eq 'StrongFighter') {
        $Global:Stats.Str += 4
        $ClassPowersPsCustom = Get-Content .\Data\Classes\Fighter.json | ConvertFrom-Json
        $ClassPowers = @{}
        $ClassPowersPsCustom.psobject.properties | ForEach-Object { $ClassPowers[$_.Name] = $_.Value }
    }
    if ($SubClass -eq 'AgileFighter') {
        $Global:Stats.Dex += 4
        $ClassPowersPsCustom = Get-Content .\Data\Classes\Fighter.json | ConvertFrom-Json
        $ClassPowers = @{}
        $ClassPowersPsCustom.psobject.properties | ForEach-Object { $ClassPowers[$_.Name] = $_.Value }
    }
    if ($SubClass -eq 'StrongMonk') {
        $Global:Stats.Str += 4
    
    }
    if ($Sublass -eq 'AgileMonk') {
        $Global:Stats.Dex += 4
    
    }
    if ($Subclass -eq 'Flurry') {
        $Global:Stats.Str += 2;
        $Global:Stats.Dex += 2
    
    }
    if ($Subclass -eq 'Outwit') {
        $Global:Stats.Dex += 2;
        $Global:Stats.Cha += 2
    
    }
    if ($Subclass -eq 'Precision') {
        $Global:Stats.Dex += 4
    
    }
    if ($Subclass -eq 'Ruffian') {
        $Global:Stats.Str += 4
    
    }
    if ($Subclass -eq 'Scoundrel') {
        $Global:Stats.Cha += 4
    
    }
    if ($Subclass -eq 'Thief') {
        $Global:Stats.Dex += 4
    
    }
    if ($Class -eq 'Sorcerer') {
        $Global:Stats.Cha += 4
    
    }
    if ($Class -eq 'Wizard') {
        $Global:Stats.Int += 4
    
    }

    
    # Apply all class powers and features
    $SkillFeatLevels = @()
    foreach ($Lvl in ($ClassPowers.GetEnumerator() | Sort-Object -Property name).name) {
        if ($ClassPowers.$Lvl.'Level' -gt $Global:Level) { break } # Exit loop when character level is exceeded
        if ($ClassPowers.$Lvl.Perception) { $Global:Perception = $ClassPowers.$Lvl.Perception }
        if ($ClassPowers.$Lvl.FortSave) { $Global:FortSave = $ClassPowers.$Lvl.FortSave }
        if ($ClassPowers.$Lvl.RefSave) { $Global:RefSave = $ClassPowers.$Lvl.RefSave }
        if ($ClassPowers.$Lvl.WillSave) { $Global:WillSave = $ClassPowers.$Lvl.WillSave }
        if ($ClassPowers.$Lvl.UnarmedAttackProf) { $Global:UnarmedAttackProf = $ClassPowers.$Lvl.UnarmedAttackProf }
        if ($ClassPowers.$Lvl.SimpleWeaponProf) { $Global:SimpleWeaponProf = $ClassPowers.$Lvl.SimpleWeaponProf }
        if ($ClassPowers.$Lvl.MartialWeaponProf) { $Global:MartialWeaponProf = $ClassPowers.$Lvl.MartialWeaponProf }
        if ($ClassPowers.$Lvl.AdvancedWeaponProf) { $Global:AdvancedWeaponProf = $ClassPowers.$Lvl.AdvancedWeaponProf }
        if ($ClassPowers.$Lvl.UnarmoredDefense) { $Global:UnarmoredDefense = $ClassPowers.$Lvl.UnarmoredDefense }
        if ($ClassPowers.$Lvl.LightArmor) { $Global:LightArmor = $ClassPowers.$Lvl.LightArmor }
        if ($ClassPowers.$Lvl.MediumArmor) { $Global:MediumArmor = $ClassPowers.$Lvl.MediumArmor }
        if ($ClassPowers.$Lvl.HeavyArmor) { $Global:HeavyArmor = $ClassPowers.$Lvl.HeavyArmor }
        if ($ClassPowers.$Lvl.ClassDc) { $Global:ClassDc = $ClassPowers.$Lvl.ClassDc }
        if ($ClassPowers.$Lvl.HitPoints) { $Global:Hp += ([int]$ClassPowers.$Lvl.HitPoints) }
        if ($ClassPowers.$Lvl.AncestryFeat) { $Global:AncestryFeats += $ClassPowers.$Lvl.AncestryFeat }
        if ($ClassPowers.$Lvl.ClassFeat) { $Global:ClassFeats += $ClassPowers.$Lvl.ClassFeats | Get-Random }
        if ($ClassPowers.$Lvl.GeneralFeat -eq 'OneMore') { $Global:GeneralFeats += $Global:GeneralFeatList.$Lvl | Get-Random }
        if ($ClassPowers.$Lvl.SkillFeat) { $Global:SkillFeatsLevels += [int]($Lvl.substring(3)) }
    }
}
