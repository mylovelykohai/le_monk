void trippyFill() {
  float h = random(0, 360);
  fill(h, 90, 90);
  h = (h + 1) % 360;
}
