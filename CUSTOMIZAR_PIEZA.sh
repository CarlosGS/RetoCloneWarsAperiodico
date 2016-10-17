
while read -r line;
do openscad -o "$line.stl" -D 'texto="'$line'"' penrose.scad;
done

