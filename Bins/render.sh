#! /bin/sh
set -e

here="$(readlink -f "$(dirname "$0")")"

inputs="smd2x1 smd2x2s smd_funnel"

# OPENSCAD=openscad
OPENSCAD=openscad-nightly

for input in $inputs; do
    "${OPENSCAD}" -o "${here}/${input}.stl" "${here}/${input}.scad"
done
