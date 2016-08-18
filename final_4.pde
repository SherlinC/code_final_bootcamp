
import ddf.minim.*;
Minim minim;
import ddf.minim.analysis.*;
AudioPlayer player;
FFT fft;
int count = 0;
int count2 = 0;
int count3= 0;
float r=100;
float theta=10;


void setup() {
  
  minim = new Minim(this);
  player = minim.loadFile("intro.mp3");
  player.play();
  size(500, 500);
  fft = new FFT(player.bufferSize(), player.sampleRate());

  
}

void draw() 
{
   background(0);

  //sea wave
  stroke(255);
  if (count==1) {
    for (int i = 0; i < player.bufferSize() - 1; i++)
    {
      float left1 = 150 + player.left.get(i) * 50;
      float left2 = 50 + player.left.get(i+1) * 50;
      float right1 = 360 + player.right.get(i) * 50;
      float right2 = 460 + player.right.get(i+1) * 50;
    
      
      strokeWeight(50);
      stroke(150,200,255,30);
      line(i, right1+90-150, i+1, right2-150);
      stroke(150,180,255,30);
      line(i, right1+90-100, i+1, right2-100);
      stroke(100,140,255,30);
      line(i, right1+90-50, i+1, right2-50);
      stroke(50,100,255,30);
      line(i, right1+90, i+1, right2);
      stroke(20,60,255,30);
      line(i, right1+90+50, i+1, right2+50);
    }
  }
  

  //sunrise around 12
   stroke(255);
  if (count2==2) {
    for (int i = 0; i < player.bufferSize() - 10; i++)
    {  float b = player.left.get(i)*cos(theta)*340;
       float m =  player.left.get(i)*sin(theta)*340;
  fill(random(255), random(120), 0,30);
  noStroke();
  ellipse(b*100,m*30,20,20);
  ellipse(b*70,m*30,20,20); 
  ellipse(b*50,m*30,20,20);
  ellipse(b*40,m*30,20,20); 
  ellipse(b*30,m*30,20,20);
  ellipse(b*20,m*30,20,20);
  ellipse(b*18,m*30,20,20);
  ellipse(b*15,m*30,20,20);
  ellipse(b*12,m*30,20,20); 
  ellipse(b*9,m*30,20,20); 
  ellipse(b*6,m*30,20,20);
  ellipse(b*3,m*30,20,20);
    
    }
    
    //sun
    fill(255,150,0);
    ellipse(0,0,160+10*player.left.get(50),160+10*player.left.get(50));
    fill(255,150,0,30);
    ellipse(0,0,180+10*player.left.get(50),180+10*player.left.get(50));
    ellipse(0,0,190+10*player.left.get(50),190+10*player.left.get(50));
    ellipse(0,0,200+10*player.left.get(50),200+10*player.left.get(50));
    ellipse(0,0,210+10*player.left.get(50),210+10*player.left.get(50));
  }  
//sunrise beginning
  fft.forward(player.mix);
  noStroke();
  if(count3==0){
  fill(random(230,255), random(120,140), 0,80);
  for (int i = 0; i < 300; i++) {
    frameRate(15);
    float b = fft.getBand(i);
    float x = random(-b-20, b+20) + width/2;
    float y = random(-b-20, b+20) + height/2;
    //i*4;
    ellipse(x, y, b*2, b*2);
    

  }

}
}

void stop() 
{
  player.close();
  minim.stop();
  super.stop();
}

void keyPressed() {
  if (key=='o') {
    count =1;
  } else if (key=='1') {
    count = 0;
  }
  else if(key =='l'){
    count2= 2;
    count3 = 1;
  }else if (key=='2') {
    count2 = 1;
    count3 = 0;
  }
}