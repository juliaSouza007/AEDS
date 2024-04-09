class Peixes {
    float centerX, centerY, bodyLength, bodyHeight, tailWidth, tailHeight;
    color bodyColor;
    PVector pos, vel, acel; // Define a posição, velocidade e aceleração do peixe

    Peixes () {
        this.centerX = centerX;
        this.centerY = centerY;
        this.bodyLength = bodyLength;
        this.bodyHeight = bodyHeight;
        this.bodyColor = bodyColor;

        this.tailWidth = tailWidth;
        this.tailHeight = tailHeight;

        this.pos = pos;
        this.vel = vel;
        this.acel = acel;
    }


    void move(){

    }

    void  desenha(){
         noStroke();
         fill(bodyColor);

         // body
        ellipse(centerX, centerY, bodyLength, bodyHeight);

        // tail
        triangle(centerX-bodyLength/2, centerY,
              centerX-bodyLength/2-tailWidth, centerY-tailHeight,
              centerX-bodyLength/2-tailWidth, centerY+tailHeight);
    }

}