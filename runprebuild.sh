#!/bin/sh

cp lib/* bin/

# Libraries fetched from NuGet (see THIRD-PARTY.md, .nuget/packages.config and
# scripts/nuget-libs.txt). Run "nuget restore Halcyon.sln" first; build.sh does
# this for you.
if [ ! -d packages ]; then
    echo "runprebuild: no packages/ folder. Run 'nuget restore Halcyon.sln' first." >&2
    exit 1
fi

# 1.6.0.0, 1.6.0 and 1.6 are the same version to NuGet, which may use any of
# them for a package's folder name.
short() { echo "$1" | sed -e ':a' -e 's/\.0$//' -e 'ta'; }

missing=0
while read -r id version rel dest; do
    case "$id" in ''|'#'*) continue ;; esac
    src=""
    for d in packages/"$id".*; do
        [ -d "$d" ] || continue
        v=${d#packages/"$id".}
        if [ "$(short "$v")" = "$(short "$version")" ] && [ -f "$d/$rel" ]; then
            src="$d/$rel"; break
        fi
    done
    if [ -z "$src" ]; then
        echo "runprebuild: missing $id $version ($rel)" >&2
        missing=1; continue
    fi
    to=bin; [ "$dest" = "." ] || to="bin/$dest"
    mkdir -p "$to"
    cp "$src" "$to/"
done < scripts/nuget-libs.txt

if [ "$missing" != 0 ]; then
    echo "runprebuild: restored packages are:" >&2
    ls packages >&2
    exit 1
fi
