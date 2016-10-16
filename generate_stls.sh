
while read -r line;
do openscad -o "./STLs/$line.stl" -D 'texto="'$line'"' penrose.scad;
done

