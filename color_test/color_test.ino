#include <MCUFRIEND_kbv.h>
MCUFRIEND_kbv tft;
void setup() {
  Serial.begin(115200);
  delay(1000);
  uint16_t id = tft.readID();
  Serial.print("Read ID: 0x"); Serial.println(id, HEX);
  Serial.println("Initializing HX8352B (0x0065), OPENSMART MEGA");
  tft.begin(0x0065);
  tft.setRotation(0);
  int w = tft.width(), h = tft.height();
  tft.fillRect(0, 0, w, h / 3, 0xF800);
  tft.fillRect(0, h / 3, w, h / 3, 0x07E0);
  tft.fillRect(0, 2 * h / 3, w, h - 2 * h / 3, 0x001F);
  tft.setTextColor(0xFFFF);
  tft.setTextSize(3);
  tft.setCursor(10, 20); tft.println("HX8352B");
  tft.setCursor(10, h / 3 + 20); tft.println("MEGA 2560");
  tft.setCursor(10, 2 * h / 3 + 20); tft.println("COLOR TEST");
  Serial.println("Color bars drawn");
}
void loop() {}
