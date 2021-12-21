function New-AbilityBoosts {
    # There's four boosts to apply. The first two will be the same as the background ones.
    $Global:Stats.$($Global:Background.'Ability boost option 1') += 2
    $Global:Stats.$($Global:Background.'Ability boost option 2') += 2
    
    # The last two will be picked at random.
    $StatsToBoost = @('STR', 'CON', 'DEX', 'INT', 'WIS', 'CHA') | Where-Object {
        $_ -ne $Global:Background.'Ability boost option 1' -and 
        $_ -ne $Global:Background.'Ability boost option 2'} | Get-Random -Count 2

    foreach ($Stat in $StatsToBoost) {
        $Global:Stats.$Stat += 2
    }
}