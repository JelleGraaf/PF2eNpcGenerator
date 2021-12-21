function Invoke-SkillIncrease {
    # Get all skills that are not untrained
    $TrainedSkills = @()
    foreach ($SkillName in $Global:Skills.keys) {
        if ($Global:Skills.$SkillName.Proficiency -eq 'Trained') {
            $TrainedSkills += $SkillName
        }
    }

    $ExpertSkills = @()
    foreach ($SkillName in $Global:Skills.keys) {
        if ($Global:Skills.$SkillName.Proficiency -eq 'Expert') {
            $ExpertSkills += $SkillName
        }
    }

    $MasterSkills = @()
    foreach ($SkillName in $Global:Skills.keys) {
        if ($Global:Skills.$SkillName.Proficiency -eq 'Master') {
            $MasterSkills += $SkillName
        }
    }

    If ($Global:Level -ge 15) {
        $MasterSkills | Get-Random
        # do something to legendary
    }
    elseif ($Global:Level -ge 7) {
        # do something to master
    }
    else {
        # do something to expert
    }
}