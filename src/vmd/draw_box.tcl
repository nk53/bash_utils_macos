package require pbctools

# get args
set x [lindex $argv 0]
set y [lindex $argv 1]
set z [lindex $argv 2]
set filename [lindex $argv 3]

mol new $filename
if {[string match "*.psf" $filename] == 1} {
    set baseind [string last psf $filename]
    incr baseind -1
    set crdfile [string range $filename 0 $baseind]crd
    echo crdfile: $crdfile
    echo x: $x y: $y z: $z
    mol addfile $crdfile type cor
}

echo $filename

# load PDB file
mol representation NewCartoon
mol addrep 0
#mol new {$filename} type {pdb} first 0 last -1 step 1 waitfor 1

# draw box
pbc set [concat $x $y $z]
set box_init [pbc box_draw -center origin]
