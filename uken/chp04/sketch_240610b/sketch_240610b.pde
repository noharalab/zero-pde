// Firework Particle class
class Particle {
  float x, y; // Position
  float vx, vy; // Velocity
  float lifespan; // Lifespan of the particle
  
  Particle(float x_, float y_) {
    x = x_;
    y = y_;
    vx = random(-1, 1); // Random velocity
    vy = random(-10, -3); // Random upward velocity
    lifespan = 255; // Initial lifespan
  }
  
  // Update particle position and decrease lifespan
  void update() {
    x += vx;
    y += vy;
    lifespan -= 5; // Decrease lifespan over time
  }
  
  // Display the particle
  void display() {
    if (lifespan > 150) {
      stroke(255, lifespan); // White color when lifespan is high
    } else if (lifespan > 50) {
      stroke(255, 0, 0, lifespan); // Red color when lifespan is moderate
    } else {
      stroke(0, 100, 0, lifespan); // Dark green color when lifespan is low
    }
    strokeWeight(2);
    point(x, y);
  }
  
  // Check if the particle is dead
  boolean isDead() {
    return lifespan < 0;
  }
}

// Array to hold particles
ArrayList<Particle> particles;

void setup() {
  size(800, 600);
  particles = new ArrayList<Particle>();
  background(0);
}

void draw() {
  background(0);
  // Generate new firework every few frames
  if (frameCount % 1 == 0) {
    // Create a new firework at a random position near the top
    float startX = random(width);
    float startY = height;
    Particle firework = new Particle(startX, startY);
    particles.add(firework);
  }
  
  // Update and display all particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    p.display();
    // Remove dead particles
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}
