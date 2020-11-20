#set psffile [lindex $argv 0]
set crdfile [lindex $argv 0]
set style [lindex $argv 1]

#mol new $psffile type psf forst 0 last -1 step 1 waitfor 0
mol addfile $crdfile type cor first 0 last -1 step 1 waitfor 1 0

if {"$style" != ""} {
    mol modselect 0 0 all
    mol modstyle 0 0 $style
}
