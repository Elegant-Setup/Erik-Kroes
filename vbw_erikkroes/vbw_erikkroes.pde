int grid = 60;
int f = 10;
color[] c = new color[7];
c[0] = color(0);
c[1] = color(200);
c[2] = color(255);
c[3] = color(250,240,60);
c[4] = color(200,60,30);
c[5] = color(10,15,140);
noStroke(); 

PImage img = createImage(grid,grid, RGB);
img.loadPixels();
for(int i=0; i<grid*grid; i++){
  img.pixels[i] = c[int(random(6))];
}
img.updatePixels();


size(grid*f, grid*f);
image(img, 0, 0, grid*f, grid*f);

int y = 0;
while(y<grid*f){
  int x = 0;
  int s = int(random(3,8))*f;
  while (x<grid*f){
    if(random(10)>=3){
      fill(c[int(random(1,6))]);
      rect(x, y, s, s);   
      if(random(10)>=7){  
        fill(c[int(random(0,6))]);
        rect(x+(s/3), y+(s/3), (s/3), (s/3));
      } 
      x+=s;   
    }
    else { x+=f; }  
  }
 y+=s+f; 
}  

fill(255);
float r = sqrt(2*sq(grid*f/2));

rotate(QUARTER_PI);
translate(-r/2,-r/2);
for(int i = 0; i<4; i++){
  rect( (cos(i*HALF_PI)+1)*r, cos((i+1)*HALF_PI)*r, r, r);
}

/*  This is what we actually do.
rect(0,0,r,r);
rect(r,r,r,r);
rect(2*r,0,r,r);
rect(r,-r,r,r);
*/

save(year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second()+"_grid"+grid+".tif");
