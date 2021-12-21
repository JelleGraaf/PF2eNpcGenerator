function Write-Skills {
    foreach ($Skill in ($Global:Skills.GetEnumerator() | Sort-Object -Property name).name) {
        
        $SkillProficiency = Get-ProficiencyNumber -Proficiency $Global:Skills.$Skill.Proficiency -BoundStat $($Global:Skills.$Skill.Stat)
        
        Write-Host "$Skill`: $SkillProficiency ($($Global:Skills.$Skill.Proficiency))."
    }
}
