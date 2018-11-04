ArrayList<PVector> data;

float m = 0;
float b = 0;

void setup() {
  size(640, 360);
  frameRate(60);
  data = new ArrayList();
}

void gradientDescent() {
  float learning_rate = 0.08;
  for (int i = 0; i < data.size(); i++) {
    float x = data.get(i).x;
    float y = data.get(i).y;
    float guess = m * x + b;
    float error = y - guess;
    m = m + error * x * learning_rate;
    b = b + error * learning_rate;
  }



}

void drawLine() {
  float x1 = 0;
  float y1 = m * x1 + b;
  float x2 = 1;
  float y2 = m * x2 + b;

  x1 = map(x1, 0, 1, 0, width);
  y1 = map(y1, 0, 1, height, 0);
  x2 = map(x2, 0, 1, 0, width);
  y2 = map(y2, 0, 1, height, 0);

  stroke(255);
  strokeWeight(2);
  line(x1, y1, x2, y2);


}


void mousePressed() {
  float x = map(mouseX, 0, width, 0, 1);
  float y = map(mouseY, 0, height, 1, 0);
  PVector point = new PVector(x, y);
  data.add(point);
}

void draw() {
  background(51);
  for (int i = 0; i < data.size(); i++) {
    float x = map(data.get(i).x, 0, 1, 0, width);
    float y = map(data.get(i).y, 0, 1, height, 0);
    fill(255);
    stroke(255);
    ellipse(x, y, 8, 8);
  }

  if (data.size() > 1) {
    gradientDescent();
    drawLine();
  }

}