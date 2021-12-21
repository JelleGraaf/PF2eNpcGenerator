function Get-ProficiencyNumber {
    param(
        [ValidateSet('Untrained', 'Trained', 'Expert', 'Master', 'Legendary')]
        $Proficiency,
        [ValidateSet('Str', 'Con', 'Dex', 'Int', 'Wis', 'Cha')]
        $BoundStat = $null
    )

    # Get ability score modifier (only if a bound stat is entered. If not, the calculation will be only proficiency + level)
    if ($BoundStat) {
        $AbilityScoreModifier = ($($Global:Stats.$BoundStat) - 10) / 2
    }
        
    # Get proficiency modifier
    if ($Proficiency -eq 'UnTrained') { $ProficiencyModifier = 0 }
    if ($Proficiency -eq 'Trained') { $ProficiencyModifier = 2 + $Global:Level }
    if ($Proficiency -eq 'Expert') { $ProficiencyModifier = 4 + $Global:Level }
    if ($Proficiency -eq 'Master') { $ProficiencyModifier = 6 + $Global:Level }
    if ($Proficiency -eq 'Legendary') { $ProficiencyModifier = 8 + $Global:Level }

    # Calculate proficiency number
    $ProficiencyNumber = $AbilityScoreModifier + $ProficiencyModifier

    return $ProficiencyNumber
}
