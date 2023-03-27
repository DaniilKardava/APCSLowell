double zoom = 3;
double xShift = .1;

double[] pixelToComplex(double siz, double x, double y) {
  double real = (zoom / siz) * (x- siz/1.5) - xShift; 
  double imaginary = (zoom / siz) * (y- siz/2);
  double[] complexNumer = {real, imaginary};
  return complexNumer;
}

color pixelColor;
int resolution = 100;
color[] gradient = new color[resolution];

Boolean mandelbrot(double[] c, double[] recursiveTerm, int step) {
  // Calculate complex number's distance from center
  double radius = Math.sqrt(Math.pow(recursiveTerm[0],2) - Math.pow(recursiveTerm[1],2));
  if (radius >= 2){
    pixelColor = gradient[step];
    //pixelColor = color(255,255,255);
    return false;
  } else {
    if (step >= resolution - 1) {
      pixelColor = color(0,0,0);
      return true;
    }
      
    // If no imaginary component
    double[] nextTerm = new double[2];
    if (recursiveTerm[1] == 0) {
      nextTerm[0] = Math.pow(recursiveTerm[0], 2) + c[0]; 
      nextTerm[1] = c[1];
    } else {      
        double realComponent = Math.pow(recursiveTerm[0], 2) - Math.pow(recursiveTerm[1], 2);
        double imaginaryComponent = 2 * recursiveTerm[0] * recursiveTerm[1];

        nextTerm[0] =  realComponent + c[0]; 
        nextTerm[1] = imaginaryComponent + c[1];
    }
    
    return mandelbrot(c, nextTerm, step + 1);
  }
  
}


double specialNumber = 3;
int speed = 10;
void setup() {
 colorMode(HSB, 360, 100, 100);
 for (int i = 0; i < resolution; i++) {
   gradient[i] = color(200 + 360 * i / resolution, 100, 100);
 }
 size(500,500); 
}

int frame = 0;
void draw() {
  background(255);
  for (int x = 0; x < width; x ++) {
    for (int y = 0; y < width; y++) {
      double[] complexNumber = pixelToComplex(width, x, y);
      mandelbrot(complexNumber, complexNumber, 0);
      if (true) {
        set(x, y, pixelColor);
    }
   }
 }
 frame += 1;
 
 for (int i = 0; i < speed; i++) {
   zoom *= .99; 
   xShift += .0046623 * zoom;
   if (zoom <= 4.688291340859202E-4) {
    zoom = 3;
    xShift = .1;
   }
 }
 
 
 
}
