# Calculates center-of-mass of a given PDB
set pdb [lindex $argv 0]
set sel [lrange $argv 1 end]

puts $sel

if {$sel == ""} {
    set sel "all"
}

if { [string first .crd $pdb] == -1 } {
    mol new "$pdb"
} else {
    mol new "$pdb" type cor first 0 last -1 step 1 waitfor 1
}
set sel [atomselect top "$sel"]
measure center $sel weight mass

quit
