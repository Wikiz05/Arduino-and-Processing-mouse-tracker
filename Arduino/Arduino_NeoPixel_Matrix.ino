/*
  Sketch arduino por Waldo Costa
  http://www.waldocosta.com.br
  atualizado em: 2017 nov 11

  Baseado parcialmente no sketch de Tom Igoe disponível em:
  http://www.arduino.cc/en/Tutorial/SerialEvent
*/

#include <Adafruit_NeoPixel.h>

#define BRILHO    255  // valor entre 0 e 255
#define PIXEL_COUNT 5  // numero de pixels em cada LED strip

int delayval = 100;   // delay entre a atualização dos pixels
                      // utilizar apenas para conferir a ordem de atualização
int indice_i = 0;     
int indice_j = 0;     // índices para a matriz das cores

// valores iniciais para vermelho, verde e azul
int vermelho[4][5] = {
  {0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0}
};

int verde[4][5] = {
  {255, 255, 255, 255, 255},
  {255, 255, 255, 255, 255},
  {255, 255, 255, 255, 255},
  {255, 255, 255, 255, 255}
};

int azul[4][5] = {
  {0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0}
};

// Parameter 1 = number of pixels in strip,  neopixel stick has 8
// Parameter 2 = pin number (most are valid)
// Parameter 3 = pixel type flags, add together as needed:
//   NEO_RGB     Pixels are wired for RGB bitstream
//   NEO_GRB     Pixels are wired for GRB bitstream, correct for neopixel stick
//   NEO_KHZ400  400 KHz bitstream (e.g. FLORA pixels)
//   NEO_KHZ800  800 KHz bitstream (e.g. High Density LED strip), correct for neopixel stick
Adafruit_NeoPixel strip1 = Adafruit_NeoPixel(PIXEL_COUNT, 5, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel strip2 = Adafruit_NeoPixel(PIXEL_COUNT, 6, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel strip3 = Adafruit_NeoPixel(PIXEL_COUNT, 9, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel strip4 = Adafruit_NeoPixel(PIXEL_COUNT, 10, NEO_GRB + NEO_KHZ800);


void color_all_pixels(uint32_t c) {
  // função utilizada para preencher todos os
  // leds com uma única cor
  for (uint16_t i = 0; i < PIXEL_COUNT; i++) {
    strip1.setPixelColor(i, c);
    strip1.show();
    strip2.setPixelColor(i, c);
    strip2.show();
    strip3.setPixelColor(i, c);
    strip3.show();
    strip4.setPixelColor(i, c);
    strip4.show();
  }
}

void inicia_LEDs() {
  // Inicia todos pixels com a cor azul, assim é possível saber
  // se a conexão com o processing aconteceu corretamente.
  // Logo que acontecer a conexão serial o processing enviará
  // uma cor diferente para cada pixel.
  color_all_pixels(strip1.Color(0, 0, 255));
}


void setup() {

  // initialize serial:
  Serial.begin(9600);

  strip1.setBrightness(BRILHO);
  strip1.begin();
  strip1.show();
  strip2.setBrightness(BRILHO);
  strip2.begin();
  strip2.show();
  strip3.setBrightness(BRILHO);
  strip3.begin();
  strip3.show();
  strip4.setBrightness(BRILHO);
  strip4.begin();
  strip4.show();

  inicia_LEDs();
}

void loop() {

  while (Serial.available() > 0) {

    indice_i = Serial.parseInt();
    indice_j = Serial.parseInt();
    int red = Serial.parseInt();
    int green = Serial.parseInt();
    int blue = Serial.parseInt();

    if (Serial.read() == '\n') {
      vermelho[indice_i][indice_j] = red;
      verde[indice_i][indice_j]    = green;
      azul[indice_i][indice_j]     = blue;
    }
  }

  //escreve colunas
  for (int k = 0; k < PIXEL_COUNT; k++) {

    strip1.setPixelColor(k, strip1.Color(vermelho[0][k], verde[0][k], azul[0][k])); //
    strip1.show();
    // o delay pode ser ativado para observar a ordem em que as cores são atualizadas
    //delay(delayval);

    strip2.setPixelColor(k, strip2.Color(vermelho[1][k], verde[1][k], azul[1][k])); //
    strip2.show();
    //delay(delayval);

    strip3.setPixelColor(k, strip3.Color(vermelho[2][k], verde[2][k], azul[2][k])); //
    strip3.show();
    //delay(delayval);

    strip4.setPixelColor(k, strip4.Color(vermelho[3][k], verde[3][k], azul[3][k])); //
    strip4.show();
    //delay(delayval);
  }


}//fim do loop
