ArrayList<ArrayList<PVector>> curves;
float distanceThreshold = 16;

void setup() {
  size(800, 600);
  curves = new ArrayList<ArrayList<PVector>>();
}

void draw() {
  background(255);
  
  // Draw all recorded points for each curve
  for (ArrayList<PVector> curve : curves) {
    fill(0);
    for (PVector point : curve) {
      ellipse(point.x, point.y, 10, 10);
    }
    
    // Draw Bezier curve for each set of points
    if (curve.size() == 4) {
      noFill();
      stroke(0);
      strokeWeight(2);
      bezier(curve.get(0).x, curve.get(0).y,
             curve.get(1).x, curve.get(1).y,
             curve.get(2).x, curve.get(2).y,
             curve.get(3).x, curve.get(3).y);
    }
  }
  
  // Draw temporary line for ongoing Bezier construction
  if (curves.size() > 0 && curves.get(curves.size() - 1).size() > 0 && curves.get(curves.size() - 1).size() < 4) {
    ArrayList<PVector> currentCurve = curves.get(curves.size() - 1);
    noFill();
    stroke(150);
    strokeWeight(2);
    int size = currentCurve.size();
    if (size == 2) {
      // Draw a line if there are 2 points
      line(currentCurve.get(0).x, currentCurve.get(0).y, currentCurve.get(1).x, currentCurve.get(1).y);
    } else if (size == 3) {
      // Draw a quadratic Bezier curve if there are 3 points
      PVector p0 = currentCurve.get(0);
      PVector p1 = currentCurve.get(1);
      PVector p2 = currentCurve.get(2);
      float cx = lerp(p0.x, p2.x, 0.5);
      float cy = lerp(p0.y, p2.y, 0.5);
      bezier(p0.x, p0.y, p1.x, p1.y, cx, cy, p2.x, p2.y);
    }
  }
}

void mousePressed() {
  // Clear curves if right mouse button is pressed
  if (mouseButton == RIGHT) {
    curves.clear();
    return;
  }
  
  // Record the current mouse position
  PVector position = new PVector(mouseX, mouseY);
  
  // Check if there are previous curves
  if (curves.size() > 0) {
    ArrayList<PVector> previousCurve = curves.get(curves.size() - 1);
    
    // Check if the previous curve is complete and if the start point of the new curve is close to the final point of the previous curve
    if (previousCurve.size() == 4) {
      PVector finalPoint = previousCurve.get(3);
      float distance = dist(position.x, position.y, finalPoint.x, finalPoint.y);
      
      // If the distance is less than the threshold, merge the start point of the new curve with the final point of the previous curve
      if (distance < distanceThreshold) {
        position.set(finalPoint);
      }
    }
  }
  
  // Add the point to the last curve if it exists
  if (curves.size() > 0 && curves.get(curves.size() - 1).size() < 4) {
    curves.get(curves.size() - 1).add(position);
  } else {
    // Otherwise, start a new curve with this point
    ArrayList<PVector> newCurve = new ArrayList<PVector>();
    newCurve.add(position);
    curves.add(newCurve);
  }
}