#! /bin/sh
set -e

here="$(readlink -f "$(dirname "$0")")"

inputs="Shelf SMDCabinet"

# OPENSCAD=openscad
OPENSCAD=openscad-nightly

for input in $inputs; do
    "${OPENSCAD}" -o "${here}/${input}.stl" "${here}/${input}.scad"
done
