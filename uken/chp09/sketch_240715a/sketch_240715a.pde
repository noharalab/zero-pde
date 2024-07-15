import processing.video.*;
PImage rabbit;

Movie mv;

boolean dragging = false;
float progress = 0.0;  // Progress of the video (0.0 to 1.0)
float progressBarHeight = 20;
float rabbitSize = 30;

void setup() {
  size(400, 600);

  mv = new Movie(this, "sample.mp4");
  mv.play();

  rabbit = loadImage("rabbit.png");  // Load the rabbit image
}

void draw() {
  background(0);

  if (mv.available()) {
    mv.read();
  }

  // If dragging, update video time based on progress
  if (dragging) {
    float t = progress * mv.duration();
    mv.jump(t);
  } else {
    // Update progress based on the current time of the video
    progress = mv.time() / mv.duration();
  }

  // Draw the video
  image(mv, 0, 0);

  // Draw the progress bar background (green grass)
  fill(34, 139, 34);  // Green color for grass
  rect(0, height - progressBarHeight, width, progressBarHeight);

  // Draw the progress bar
  fill(34, 139, 34);
  rect(0, height - progressBarHeight, width * progress, progressBarHeight);

  // Draw the rabbit button
  float rabbitX = width * progress - rabbitSize / 2;
  float rabbitY = height - progressBarHeight - rabbitSize / 2;
  image(rabbit, rabbitX, rabbitY, rabbitSize, rabbitSize);
}

void mousePressed() {
  if (mouseY >= height - progressBarHeight - rabbitSize / 2 && mouseY <= height) {
    dragging = true;
    updateProgress();
  }
}

void mouseDragged() {
  if (dragging) {
    updateProgress();
  }
}

void mouseReleased() {
  dragging = false;
}

void updateProgress() {
  progress = constrain((float) mouseX / width, 0.0, 1.0);
  float t = progress * mv.duration();
  mv.jump(t);
}
