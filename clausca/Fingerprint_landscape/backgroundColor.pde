class BackgroundColorListener implements ControlListener {
  public void controlEvent(ControlEvent theEvent) {
    

    int backgroundColor = color(cp5.getValue("background_v1"),
        cp5.getValue("background_v2"),
        cp5.getValue("background_v3"));
    float brightness;

    colorMode(HSB, 360, 100, 100);
    brightness = brightness(backgroundColor);
    if (((RadioButton) cp5.get("colorModel")).getState("RGB")) {
      colorMode(RGB, 255, 255, 255);
    }

   
  }
}
