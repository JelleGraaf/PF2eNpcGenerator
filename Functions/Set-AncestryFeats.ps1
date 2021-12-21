function Set-AncestryFeats {
    $AncestryFeatsPicked = $Global:Ancestry.AncestryFeats | Get-Random -Count $Global:Ancestry.NumberOfAncestryFeats
    $Global:AncestryFeats += $AncestryFeatsPicked
}