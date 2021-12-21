function Get-Level {
    $Level = Read-Host 'What level do you want your NPC to be (currently supports 1-5)'
    return $Level
}