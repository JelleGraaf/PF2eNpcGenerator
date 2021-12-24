function New-Background {
    # Import all backgrounds from file and place it in a hash table   
    $BackgroundsPsCustom = Get-Content .\Data\Backgrounds.json | ConvertFrom-Json
    $Backgrounds = @{}
    $BackgroundsPsCustom.psobject.properties | ForEach-Object { $Backgrounds[$_.Name] = $_.Value }
    
    # Sort the backgrounds by stats effected
    $BgStr = @()
    $BgCon = @()
    $BgDex = @()
    $BgInt = @()
    $BgWis = @()
    $BgCha = @()
    foreach ($Bg in $Backgrounds.Keys) {
        If ($Backgrounds.$Bg.'Ability boost option 1' -eq 'STR' -or $Backgrounds.$Bg.'Ability boost option 2' -eq 'STR') { $BgStr += $Bg }
        If ($Backgrounds.$Bg.'Ability boost option 1' -eq 'CON' -or $Backgrounds.$Bg.'Ability boost option 2' -eq 'CON') { $BgCon += $Bg }
        If ($Backgrounds.$Bg.'Ability boost option 1' -eq 'DEX' -or $Backgrounds.$Bg.'Ability boost option 2' -eq 'DEX') { $BgDex += $Bg }
        If ($Backgrounds.$Bg.'Ability boost option 1' -eq 'INT' -or $Backgrounds.$Bg.'Ability boost option 2' -eq 'INT') { $BgInt += $Bg }
        If ($Backgrounds.$Bg.'Ability boost option 1' -eq 'WIS' -or $Backgrounds.$Bg.'Ability boost option 2' -eq 'WIS') { $BgWis += $Bg }
        If ($Backgrounds.$Bg.'Ability boost option 1' -eq 'CHA' -or $Backgrounds.$Bg.'Ability boost option 2' -eq 'CHA') { $BgCha += $Bg }
    }

    # Get a random background with a statgain that matches the primary stat
    switch ($Global:PrimaryStat) {
        STR { $BackgroundName = $BgStr | Get-Random }
        CON { $BackgroundName = $BgCon | Get-Random }
        DEX { $BackgroundName = $BgDex | Get-Random }
        INT { $BackgroundName = $BgInt | Get-Random }
        WIS { $BackgroundName = $BgWis | Get-Random }
        CHA { $BackgroundName = $BgCha | Get-Random }
    }

    $Background = @{
        'Name'                   = $BackgroundName
        'Ability boost option 1' = $Backgrounds.$BackgroundName.'Ability boost option 1'
        'Ability boost option 2' = $Backgrounds.$BackgroundName.'Ability boost option 2'
        'Lore'                   = $Backgrounds.$BackgroundName.'Lore'
        'Flavor'                 = $Backgrounds.$BackgroundName.'Flavor'
        'Skill training'         = $Backgrounds.$BackgroundName.'Skill training'
        'Skill feat'             = $Backgrounds.$BackgroundName.'Skill feat'
    }

    # Add background ability boosts
    $Global:Stats.$($Background.'Ability boost option 1') += 2
    $Global:Stats.$($Background.'Ability boost option 2') += 2

    # Add background perks to different area's
    $Global:Skills."Lore($($Background.Lore))" = @{'Stat' = 'INT' ; 'Proficiency' = 'Trained' }
    Set-Skill -SkillName $Background.'Skill training' -Proficiency 'Trained'
    $Global:SkillFeatsChosen += $Background.'Skill feat'

    return $Background
}

