// Teselas de Penrose P2 para el reto CloneWars de la OSHWDem 2016
// Script implementado por @CarlosGS

$fn = 10; // para los agujeros

tolerancia = 0.25;
diametro_agujeros = 1;
distancia_agujeros = 5;

grosor_piezas = 3;
profundidad_texto = 0.75;

a = 40; // longitud del lado mayor
b = 0;

ang_B = 72/2;
ang_D = -72/2;

A = [0,0];
B = [a*cos(ang_B),a*sin(ang_B)];
C = [a,0];
D = [a*cos(ang_D),a*sin(ang_D)];



palabras_largas = ["altura","aporte","atasco","bowden","buenas","buscan","cambio","chasis","Ciclop","clones","código","compra","compro","CoreXY","correa","Coruña","cuando","diseño","distro","driver","evento","fallos","fuente","GitHub","gratis","hobbed","hombre","hotbed","hotend","irobri","kapton","Lewihe","libres","Madrid","manual","marcha","marcos","Marlin","mejora","modelo","mosfet","nacido","NEMA17","nombre","novato","nozzle","oferta","online","parece","pedido","piezas","poleas","precio","primer","prusas","quiero","RepRap","resina","sensor","servos","single","Slic3r","sondeo","sorteo","source","tamaño","tiempo","tienda","abierto","alguien","algunas","arduino","bobinas","calidad","cambiar","campaña","carrera","comprar","compras","consejo","consigo","correas","directo","drivers","endstop","escáner","español","finales","FreeCAD","heatbed","impreso","imprime","láseres","llegado","Lulzbot","mejoras","métrica","modelos","Moebyus","montada","montaje","motores","noticia","novedad","Obijuan","ofertas","opinion","OSHWDem","P3Steel","perdida","plotter","pololus","posible","premium","primera","printed","printer","pruebas","publica","quedada","rostock","saludos","segunda","Sevilla","sistema","soporte","stepper","tarjeta","tuercas","versión","warping","Windows","aluminio","calienta","caliente","camiseta","comienza","concurso","conectar","conjunta","conjunto","consulta","cortadas","donación","endstops","extruder","extrusor","FFFworld","firmware","flexible","funciona","hardware","hexápodo","husillos","imperial","impresas","imprimir","incluido","insertos","instalar","lineales","Makerbot","material","mejorado","necesito","nuestras","offtopic","OpenScad","pantalla","petición","planchas","plástico","pregunta","presento","primeras","primeros","problema","proyecto","Repetier","silicona","Smartrap","software","Sprinter","tutorial","Valencia","varillas","Zaragoza","autolevel","Barcelona","calibrado","calientes","camisetas","CatNozzle","CloneWars","compartir","comunidad","conjuntas","construir","cortadora","cualquier","descuento","extrusión","filamento","Hephestos","impresión","impresora","iteración","Laserlolu","Leonozzle","metálicos","Printrbot","problemas","propuesta","raspberry","temporada","termistor","Ultimaker","velocidad","vitaminas","actualizar","Aliexpress","desarrollo","donaciones","FlexiSmart","impresoras","materiales","nacimiento","prototipos","rodamiento","Skeinforge","tutoriales","ventilador","adicionales","betatesters","calibración","componentes","electrónica","fabricación","impresiones","imprimibles","imprimiendo","lanzamiento","metacrilato","printerquad","Pronterface","RepRapWorld","rodamientos","temperatura","alimentación","calentadores","certificados","construcción","crowdfunding","presentación","Sanguinololu","ventiladores","configuración"];
palabras_cortas = ["3d","al","bq","by","de","el","en","es","ha","i2","i3","in","la","lo","m3","m4","m6","me","mi","mm","no","os","PC","pi","SD","se","si","su","tu","un","V1","V2","vs","ya","3mm","95€","ABS","ADN","all","BCN","bed","box","CNC","con","del","DLP","dos","E3D","eje","end","etc","hay","hot","it2","it3","iva","kit","las","LCD","los","mal","mas","más","mis","mk8","mkI","muy","off","one","PCB","PLA","por","pre","que","qué","Re:","RRW","SAV","sin","soy","STL","TAZ","the","tus","una","uno","web","www","2012","2014","2015","220v","2560","75mm","algo","aquí","auto","base","bien","bolt","cada","cama","capa","casi","clon","code","como","cómo","cosa","Cura","deja","duda","ejes","esta","está","este","esto","foro","GEN7","hace","head","hoja","hola","Igus","inox","jedi","León","mega","MEGA","mini","NEMA","open","otra","otro","para","pasa","paso","pero","play","reto","ruta","solo","tipo","todo","unas","usar","Wars","wiki","a4988","acero","adios","árbol","ayuda","budas","busco","calor","camas","capas","carro","clase","Clone","corte","cosas","delta","desde","doble","donde","dudas","enero","entre","error","euros","fallo","falta","final","fotos","frame","gcode","grupo","hacer","juego","láser","lisas","lista","maker","marco","mejor","metal","motor","nueva","nuevo","nylon","order","party","pasos","pieza","placa","print","Prusa","puede","RAMPS","RJ4JP","robot","ruido","sobre","steel","super","tengo","tiene","todos","topic","total","unión","vendo","venta"];

function get_random_item(elements) = elements[round(rands(0, len(elements)-1, 1)[0])];



module cometa(texto) {
    color(rands(0, 1, 3)) difference() {
        linear_extrude(height=grosor_piezas) offset(r=-tolerancia) difference() {
            polygon([A,B,C,D]);
            translate(B-[distancia_agujeros/4,distancia_agujeros]) circle(d=diametro_agujeros);
            translate(D+[-distancia_agujeros/4,distancia_agujeros]) circle(d=diametro_agujeros);
        }
        translate([a-2,0,grosor_piezas]) resize([31,8,profundidad_texto*2], auto=[true,true,false]) linear_extrude(height = 1, center=true)
            text(texto, size = 4, halign="right", valign="center", font = str("FreeMono", ":style=Bold"), $fn = 16);
        translate([a-2,0,0]) resize([31,8,profundidad_texto*2], auto=[true,true,false]) linear_extrude(height = 1, center=true)
            rotate([0,180,0]) text(texto, size = 4, halign="left", valign="center", font = str("FreeMono", ":style=Bold"), $fn = 16);
    }
}

module flecha(texto) {
    color(rands(0, 1, 3)) difference() {
        linear_extrude(height=grosor_piezas) offset(r=-tolerancia) difference() {
            polygon([C-B,[0,0],D,D-B]); // TO-DO: Definir de manera elegante e intuitiva?
            translate(D-[distancia_agujeros,0]) circle(d=diametro_agujeros);
            translate(C-B+[distancia_agujeros/2,0]) circle(d=diametro_agujeros);
        }
        translate(C-B+[5,0]) translate([0,0,grosor_piezas]) rotate(-90) resize([21,8,profundidad_texto*2]) linear_extrude(height = 1, center=true)
            text(texto, size = 4, valign="center", halign="center", font = str("FreeMono", ":style=Bold"), $fn = 16);
        translate(C-B+[5,0]) rotate(-90) resize([21,8,profundidad_texto*2]) linear_extrude(height = 1, center=true)
            rotate([0,180,0]) text(texto, size = 4, valign="center", halign="center", font = str("FreeMono", ":style=Bold"), $fn = 16);
    }
}

module penrose() {
    for (i = [0:4]) rotate(i*72) {
        cometa(get_random_item(palabras_largas));
        translate([a,0]) rotate(-72/2) flecha(get_random_item(palabras_cortas));
        translate([a,0]) {
            rotate(72/2) {
                cometa(get_random_item(palabras_largas));
                translate([a,0]) rotate(-72/2) flecha(get_random_item(palabras_cortas));
                rotate(-2*72/2) translate([a,0]) rotate(3*72/2) flecha(get_random_item(palabras_cortas));
            }
            rotate(-72/2) cometa(get_random_item(palabras_largas));
        }
        translate([-2.62*a,0]) {// ¿alguien por la labor de establecer el algoritmo de teselación penrose?
            rotate(72/2) cometa(get_random_item(palabras_largas));
            rotate(-72/2) cometa(get_random_item(palabras_largas));
        }
    }
}
//penrose();

texto = "prueba"; // se sobreescribe externamente al ejecutar openscad por terminal

if(len(texto) < 7) // las palabras cortas, se usan para crear flechas
    translate([0,0,-tolerancia]) rotate([0,72/2,0]) rotate([-90,0,0]) // orientacion vertical
        flecha(texto);
else
    translate([0,0,-tolerancia]) rotate([-90,0,0]) rotate(-72/2) // orientacion vertical
        cometa(texto);
