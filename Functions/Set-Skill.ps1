function Set-Skill {
    param(
        $SkillName,
        [ValidateSet('Untrained','Trained','Expert','Master','Legendary')]
        $Proficiency
    )

    $Global:Skills.$SkillName.Proficiency = $Proficiency
}