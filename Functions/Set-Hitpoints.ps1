function Set-Hitpoints {
    # Add con bonus to HP
    $ConBonus = ($Global:Stats.'Con' - 10) / 2
    $ConHpBonus = $ConBonus * $Global:Level
    $Global:Hp += $ConHpBonus

    # Add Toughness feat to HP, if applicable
    if ($Global:GeneralFeats -contains 'Toughness') {
        $Global:Hp += $Global:Level
    }
}