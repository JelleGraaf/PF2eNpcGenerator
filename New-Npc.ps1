<#
.SYNOPSIS
    Generates a Pathfinder second edition NPC
.DESCRIPTION
    Queries user for some basic information and creates a new NPC with some random elements based on that information
.NOTES
    Stuff that works:
    - Characters up to 5th level
    - Classes:
    --- Fighter
    
    Stuff that explicitly doesn't work (yet):
    - Anything outside the CRB
    - Archetypes
    - Ancestry heritages
    - Picking skillfeats
    - creating background story
    - (Magic) Items
    - Half-Elves and Half-Orcs
    - Ancestry feats higher than lvl 1
    - All feats are just listed, but not accounted for (e.g: if a feat gives you +2 on a skill, that isn't calculated with that skill)
    - Feats selection does not take prerequisites into account

    Backlog (apart from bug fixes and the stuff that doesn't work yet):
    - make more intelligent picks for skills, feats and spells
    - Character levels up to 20

.AUTHOR
    Jelle de Graaf, december 2021
.Version
    N/A yet
#>

# Import helper functions
$Helpers = @( Get-ChildItem -Path $PSScriptRoot\Functions\ -Include *.ps1 -Recurse -ErrorAction SilentlyContinue )
Foreach ($import in $Helpers) {
    Try {
        . $import.fullname
    }
    Catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

# Define global variables
$Global:Ancestry = @{}
$Global:PrimaryStat = $null
$Global:Background = @{}
$Global:Skills = @{
    'Acrobatics'   = @{'Stat' = 'DEX' ; 'Proficiency' = 'Untrained' }
    'Arcana'       = @{'Stat' = 'INT' ; 'Proficiency' = 'Untrained' }
    'Athletics'    = @{'Stat' = 'STR' ; 'Proficiency' = 'Untrained' }
    'Crafting'     = @{'Stat' = 'INT' ; 'Proficiency' = 'Untrained' }
    'Deception'    = @{'Stat' = 'CHA' ; 'Proficiency' = 'Untrained' }
    'Diplomacy'    = @{'Stat' = 'CHA' ; 'Proficiency' = 'Untrained' }
    'Intimidation' = @{'Stat' = 'CHA' ; 'Proficiency' = 'Untrained' }
    'Lore'         = @{'Stat' = 'INT' ; 'Proficiency' = 'Untrained' }
    'Medicine'     = @{'Stat' = 'WIS' ; 'Proficiency' = 'Untrained' }
    'Nature'       = @{'Stat' = 'WIS' ; 'Proficiency' = 'Untrained' }
    'Occultism'    = @{'Stat' = 'INT' ; 'Proficiency' = 'Untrained' }
    'Performance'  = @{'Stat' = 'CHA' ; 'Proficiency' = 'Untrained' }
    'Religion'     = @{'Stat' = 'WIS' ; 'Proficiency' = 'Untrained' }
    'Society'      = @{'Stat' = 'INT' ; 'Proficiency' = 'Untrained' }
    'Stealth'      = @{'Stat' = 'DEX' ; 'Proficiency' = 'Untrained' }
    'Survival'     = @{'Stat' = 'WIS' ; 'Proficiency' = 'Untrained' }
    'Thievery'     = @{'Stat' = 'DEX' ; 'Proficiency' = 'Untrained' }
}
$Global:Stats = @{
    Str = 10
    Con = 10
    Dex = 10
    Int = 10
    Wis = 10
    Cha = 10
}
[int]$Global:Level = 1
[int]$Global:Hp = 0
$Global:Size = $null
$Global:Speed = $null
$Global:Languages = @()
$Global:SpecialAbilities = @()
$Global:Perception = 'Trained'
$Global:FortSave = 'Trained'
$Global:RefSave = 'Trained'
$Global:WillSave = 'Trained'
$Global:UnarmedAttackProf = 'Trained'
$Global:SimpleWeaponProf = 'Trained'
$Global:MartialWeaponProf = $null
$Global:AdvancedWeaponProf = $null
$Global:UnarmoredDefense = 'Trained'
$Global:LightArmor = $null
$Global:MediumArmor = $null
$Global:HeavyArmor = $null
$Global:ClassDc = 'Trained'
$Global:AncestryFeats = @()
$Global:ClassFeats = @()
$Global:GeneralFeats = @()
$Global:GeneralFeatList = @{}
[int]$Global:SkillFeatsAmount = 0
$Global:SkillFeatsChosen = @{}

# Import data
$GeneralFeatListPsCustom = Get-Content .\Functions\Data\GeneralFeats.json | ConvertFrom-Json
$GeneralFeatListPsCustom.psobject.properties | ForEach-Object { $Global:GeneralFeatList[$_.Name] = $_.Value }


#########################
#region Get information #
#########################

# Write intro to screen
#Clear-Host
#Write-Intro

# Get NPC class
$Class = Get-Class
Clear-Host
Write-Host "You chose $Class. Excellent choice!" -ForegroundColor Yellow
Write-Host

# Get NPC subclass
$Subclass = Get-Subclass
Clear-Host
Write-Host "You chose $Subclass. Excellent choice!" -ForegroundColor Yellow
Write-Host

# Get NPC ancestry
$Global:Ancestry['Name'] = Get-Ancestry
Clear-Host
Write-Host "You chose $Ancestry. Excellent choice!" -ForegroundColor Yellow
Write-Host

# Get NPC level
$Global:Level = Get-Level
Clear-Host
Write-Host "You chose your NPC to be level $Level. Excellent choice!" -ForegroundColor Yellow
Write-Host

# Get NPC wealth
#Clear-Host
#$Wealth = Get-Wealth
#Write-Host "You chose your NPC to be of $Wealth wealth. Excellent choice!" -ForegroundColor Yellow
#Write-Host

#endregion

##########################
#region Put NPC together #
##########################
# Step 1: Process ancestry
New-Ancestry

# Step 2: Process background
$Global:Background = New-Background

# Step 3: Process class
New-Class

# Step 4: Apply free ability boosts
New-AbilityBoosts

# Set final hit points
Set-Hitpoints

# Determine skills
Set-SkillList

# Determine skill feats


# Determine ancestry feats
Set-AncestryFeats

# Determine offense


# Determine defense


# Determine (the rest of the) equipment


# Determine spells



# Write background story




#endregion

########################
#region Wrap it all up #
########################
#Clear-Host
# Calculate final numbers
$FortSaveNumber = Get-ProficiencyNumber -Proficiency $Global:FortSave -BoundStat 'Con'
$RefSaveNumber  = Get-ProficiencyNumber -Proficiency $Global:RefSave  -BoundStat 'Dex'
$WillSaveNumber = Get-ProficiencyNumber -Proficiency $Global:WillSave -BoundStat 'Wis'
$ClassDcNumber = Get-ProficiencyNumber -Proficiency $Global:ClassDc


Write-NPC


#endregion
