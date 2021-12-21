function Set-SkillList {
    # Determine how many skills we need to fill out
    [int]$BonusSkills = [int]$ClassPowers.'lvl1'.'BonusSkills' + $($($Global:Stats.Int - 10) / 2)

    # Get skills the NPC is untrained in
    $SkillList = @()
    foreach ($SkillName in $Global:Skills.keys) {
        if ($Global:Skills.$SkillName.Proficiency -eq 'Untrained') {
            $SkillList += $SkillName
        }
    }

    # Make a list of all main stat skills
    $MainStatSkills = @()
    foreach ($UntrainedSkill in $SkillList) {
        if ($Global:Skills.$UntrainedSkill.Stat -eq $Global:PrimaryStat) {
            $MainStatSkills += $UntrainedSkill
        }
    }

    # Become trained in skills from the main stat skills list first
    if ($BonusSkills -ge $MainStatSkills.count) {
        foreach ($Skill in $MainStatSkills) {
            Set-Skill -SkillName $Skill -Proficiency 'Trained'
            $BonusSkills --
        }
    }
    else {
        if ($BonusSkills -gt 0) {
            $MainStatSkills | Get-Random -Count $BonusSkills
            $BonusSkills = 0
        } else {
            Write-Host "Error: no more skills to train. Report this message please." -ForegroundColor Red
        }
    }

    # Left over skills are picked randomly from the entire list of untrained skills
    if ($BonusSkills -gt 0) {
        # Get skills the NPC is untrained in
        $SkillList = @()
        foreach ($SkillName in $Global:Skills.keys) {
            if ($Global:Skills.$SkillName.Proficiency -eq 'Untrained') {
                $SkillList += $SkillName
            }
        }
        [Array]$FinalPickings = $SkillList | Get-Random -Count $BonusSkills
        foreach ($Skill in $FinalPickings) {
            Set-Skill -SkillName $Skill -Proficiency 'Trained'
        }
    }
}