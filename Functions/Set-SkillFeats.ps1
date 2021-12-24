function Set-Skillfeats {
    # Because of lazy programming instead of structural improvements: build a new hash table of skill feats, this time with numbers as keys, instead of stuff like "Lvl1"
    $SkillFeatsNew = @{}
    foreach ($SkillLvl in $SkillFeatsArray.Keys) {
        $LevelNumber = $SkillLvl.Substring(3)
        $SkillFeatsNew[$LevelNumber] = $SkillFeatsArray.$SkillLvl
    }
    
    # Get a list of all skills that are trained or higher
    $PracticedSkills = @()
    foreach ($SkillName in $Global:Skills.Keys) {
        if ($Global:Skills.$SkillName.Proficiency -ne 'Untrained') {
            $PracticedSkills += $SkillName
        }
    }

    # Import all skill feats from the practiced skills
    $AvailableSkillFeats = @()
    foreach ($SkillName in $PracticedSkills) {
        # Import the skill feats
        if ($SkillName -notlike "Lore*") { # Lore breaks the code with the parentheses, so I'm leaving it out for now. No lore skill feats for you!
            $PracticedSkillsFeatsPsCustom = Get-Content ".\Data\Skill Feats\$SkillName.json" | ConvertFrom-Json
            $PracticedSkillsFeats = @{}
            $PracticedSkillsFeatsPsCustom.psobject.properties | ForEach-Object { $PracticedSkillsFeats[$_.Name] = $_.Value }
            # Add all skill feats to a consolidated list
            foreach ($SkillFeatList in $PracticedSkillsFeats.Keys) {
                # Only add skill feats of appropriate level
                if ([int]$SkillFeatList.substring(3) -le $Global:Level) {
                    $AvailableSkillFeats += $PracticedSkillsFeats.$SkillFeatList
                }
            }
        }
    }

    # Pick from all available skill feats
    # TODO: Below code can result in duplicate skill feats. Technical debt: rewrite code to only add new skill feats to the global variable
    $Global:SkillFeatsChosen += $AvailableSkillFeats | Get-Random -Count $Global:SkillFeatsLevels.count

}
