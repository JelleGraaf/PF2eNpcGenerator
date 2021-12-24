function Get-Subclass {
    $SubclassNumber = $null
    $Subclass = $null
    if ($Class -eq 'Alchemist') {
        While (-not $SubclassNumber) {
            Write-Host 'What research field do you want your alchemist to have:' -ForegroundColor Green
            Write-Host '(1: Bomber)'
            Write-Host '(2: Chirurgeon)'
            Write-Host '(3: Mutagenist)'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'Bomber' }
                '2' { $Subclass = 'Chirurgeon' }
                '3' { $Subclass = 'Mutagenist' }
            }
        }
    }

    if ($Class -eq 'Barbarian') {
        While (-not $Subclass) {
            Write-Host 'What instinct do you want your barbarian to have:' -ForegroundColor Green
            Write-Host '(1: Dragon)'
            Write-Host '(2: Fury)'
            Write-Host '(3: Giant)'
            Write-Host '(4: Spirit)'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'Dragon' }
                '2' { $Subclass = 'Fury' }
                '3' { $Subclass = 'Giant' }
                '4' { $Subclass = 'Spirit' }
            }
        }
    }

    if ($Class -eq 'Bard') {
        While (-not $SubclassNumber) {
            Write-Host 'What muse do you want your bard to have:' -ForegroundColor Green
            Write-Host '(1: Enigma)'
            Write-Host '(2: Maestro)'
            Write-Host '(3: Polymath)'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'Enigma' }
                '2' { $Subclass = 'Maestro' }
                '3' { $Subclass = 'Polymath' }
            }
        }
    }

    if ($Class -eq 'Champion') {
        While (-not $SubclassNumber) {
            Write-Host 'What cause do you want your champion to have:' -ForegroundColor Green
            Write-Host '(1: Paladin)'
            Write-Host '(2: Redeemer)'
            Write-Host '(3: Liberator)'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'Paladin (LG)' }
                '2' { $Subclass = 'Redeemer (NG)' }
                '3' { $Subclass = 'Liberator (CG)' }
            }
        }
    }

    if ($Class -eq 'Cleric') {
        While (-not $SubclassNumber) {
            Write-Host 'What doctrine do you want your cleric to have:' -ForegroundColor Green
            Write-Host '(1: Cloistered Cleric)'
            Write-Host '(2: Warpriest)'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'Cloistered Cleric' }
                '2' { $Subclass = 'Warpriest' }
            }
        }
    }

    if ($Class -eq 'Druid') {
        While (-not $SubclassNumber) {
            Write-Host 'What order do you want your druid to be a member of:' -ForegroundColor Green
            Write-Host '(1: Animal)'
            Write-Host '(2: Flame)'
            Write-Host '(3: Leaf)'
            Write-Host '(4: Stone)'
            Write-Host '(5: Storm)'
            Write-Host '(6: Wave)'
            Write-Host '(7: Wild)'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'Animal' }
                '2' { $Subclass = 'Flame' }
                '3' { $Subclass = 'Leaf' }
                '4' { $Subclass = 'Stone' }
                '5' { $Subclass = 'Storm' }
                '6' { $Subclass = 'Wave' }
                '7' { $Subclass = 'Wild' }
            }
        }
    }

    if ($Class -eq 'Fighter') {
        While (-not $SubclassNumber) {
            Write-Host "Fighters don't have a subclass. However; do you want them to be strong, or agile?" -ForegroundColor Green
            Write-Host '1: Strong'
            Write-Host '2: Agile'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'StrongFighter' }
                '2' { $Subclass = 'Agilefighter' }
            }
        }
    }

    if ($Class -eq 'Monk') {
        While (-not $SubclassNumber) {
            Write-Host "Monks don't have a subclass. However; do you want them to be strong, or agile?" -ForegroundColor Green
            Write-Host '1: Strong'
            Write-Host '2: Agile'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'StrongMonk' }
                '2' { $Subclass = 'AgileMonk' }
            }
        }
    }

    if ($Class -eq 'Ranger') {
        While (-not $SubclassNumber) {
            Write-Host "What hunter's edge do you want your ranger to have:" -ForegroundColor Green
            Write-Host '(1: Flurry)'
            Write-Host '(2: Outwit)'
            Write-Host '(3: Precision)'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'Flurry' }
                '2' { $Subclass = 'Outwit' }
                '3' { $Subclass = 'Precision' }
            }
        }
    }

    if ($Class -eq 'Rogue') {
        While (-not $SubclassNumber) {
            Write-Host "What racket do you want your rogue to have:" -ForegroundColor Green
            Write-Host '(1: Ruffian)'
            Write-Host '(2: Scoundrel)'
            Write-Host '(3: Thief)'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'Ruffian' }
                '2' { $Subclass = 'Scoundrel' }
                '3' { $Subclass = 'Thief' }
            }
        }
    }

    if ($Class -eq 'Sorcerer') {
        While (-not $SubclassNumber) {
            Write-Host 'What bloodline do you want your sorcerer to have:' -ForegroundColor Green
            Write-Host '(1: Abberant)'
            Write-Host '(2: Angelic)'
            Write-Host '(3: Demonic)'
            Write-Host '(4: Diabolic)'
            Write-Host '(5: Draconic)'
            Write-Host '(6: Elemental)'
            Write-Host '(7: Fey)'
            Write-Host '(8: Hag)'
            Write-Host '(9: Imperial)'
            Write-Host '(10: Undead)'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'Abberant' }
                '2' { $Subclass = 'Angelic' }
                '3' { $Subclass = 'Demonic' }
                '4' { $Subclass = 'Diabolic' }
                '5' { $Subclass = 'Draconic' }
                '6' { $Subclass = 'Elemental' }
                '7' { $Subclass = 'Fey' }
                '8' { $Subclass = 'Hag' }
                '9' { $Subclass = 'Imperial' }
                '10' { $Subclass = 'Undead' }
            }
        }
    }

    if ($Class -eq 'Wizard') {
        While (-not $Subclass) {
            Write-Host 'What arcane thesis do you want your wizard to have:' -ForegroundColor Green
            Write-Host '(1: Improved Familiar Attunement)'
            Write-Host '(2: Metamagic Experimentation)'
            Write-Host '(3: Spell Blending)'
            Write-Host '(4: Spell Substitution)'
            $SubclassNumber = Read-Host -Prompt 'Your choice'

            switch ($SubclassNumber) {
                '1' { $Subclass = 'Improved Familiar Attunement' }
                '2' { $Subclass = 'Metamagic Experimentation' }
                '3' { $Subclass = 'Spell Blending' }
                '4' { $Subclass = 'Spell Substitution' }
            }
        }
    }

    # Determine primary stat, based on (sub)class
    if ($Class -eq 'Alchemist') { $Global:PrimaryStat = 'Int' }
    if ($Class -eq 'Barbarian') { $Global:PrimaryStat = 'Str' }
    if ($Class -eq 'Bard') { $Global:PrimaryStat = 'Cha' }
    if ($Class -eq 'Champion') { $Global:PrimaryStat = 'Str' } # Can also be Dex
    if ($Subclass -eq 'Cloistered Cleric') { $Global:PrimaryStat = 'Wis' }
    if ($Subclass -eq 'Warpriest') { $Global:PrimaryStat = 'Str' }
    if ($Class -eq 'Druid') { $Global:PrimaryStat = 'Wis' }
    if ($SubClass -eq 'StrongFighter') { $Global:PrimaryStat = 'Str' }
    if ($Subclass -eq 'AgileFighter') { $Global:PrimaryStat = 'Dex' }
    if ($SubClass -eq 'StrongMonk') { $Global:PrimaryStat = 'Str' }
    if ($Subclass -eq 'AgileMonk') { $Global:PrimaryStat = 'Dex' }
    if ($Subclass -eq 'Flurry') { $Global:PrimaryStat = 'Str' }
    if ($Subclass -eq 'Outwit') { $Global:PrimaryStat = 'Dex' }
    if ($Subclass -eq 'Precision') { $Global:PrimaryStat = 'Dex' }
    if ($Subclass -eq 'Ruffian') { $Global:PrimaryStat = 'Str' }
    if ($Subclass -eq 'Scoundrel') { $Global:PrimaryStat = 'Cha' }
    if ($Subclass -eq 'Thief') { $Global:PrimaryStat = 'Dex' }
    if ($Class -eq 'Sorcerer') { $Global:PrimaryStat = 'Cha' }
    if ($Class -eq 'Wizard') { $Global:PrimaryStat = 'Int' }
    
    Return $Subclass
}
