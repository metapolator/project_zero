/* set up this masters parameters */
@dictionary {
    point > center {
        widthFactor: 0.7;
    }
    point > left, point > right {
        weightFactor: 1.5;
    }
}

@namespace("
  glyph#dvI penstroke#bubble point
, glyph#dvDA penstroke#bubble point
") {
    @dictionary {
        * {
            uniformScale: 1;
        }
    }
}

/********************
 * compensate for each skeleton/weight setup *
 *                           *****************/

@namespace("glyph#dvA") {
    /* moving it back into the viewport */
    @dictionary{
        point > center {
            extraX: 150;
            xTranslate: extraX;
        }
    }
    
    @namespace(penstroke#lowerBow, penstroke#upperBow) {
        @dictionary{
            point:i(-3) > center {
                xTranslate: 30 + extraX;
            }
        }
    }
    
    @namespace(penstroke#upperBow) {
        point:i(-1) > left {
            inTension: 1.1;
            inDirIntrinsic: deg 0;
        }
        point:i(-2) > left {
            on: Polar onLength onDir + parent:center:on + Vector 17 0;
            outTension: 1.2;
            inTension: 1.5;
        }
        
        point:i(2) > left {
            outTension: 1.5
        }
        point:i(-3) > left {
            inTension: .5;
            outTension: .5;
        }
        
    }
    
    @namespace(penstroke#lowerBow) {
        point:i(-2) left {
            on: penstroke:children[-1]:left:on;
        }
        point:i(-1) left {
            in: on;
        }
        point:i(-2) left {
            out: on;
        }
        
        /* the drop */
        @namespace("point:i(0), point:i(1)") {/* " ; */
            @dictionary {
                * {
                    uniformScale: 1.2;
                }
                center {
                    xTranslate: -130 + extraX;
                    yTranslate: -30;
                }
            }
        }
        
        point:i(2) > left {
            outTension: 1.5
        }
        point:i(-2) > left{
            inTension: 1.5;
        }
        point:i(-3) > left {
            inTension: .5;
            outTension: .5;
        }
        
        point:i(1) > left {
            outTension: 2;
            inTension: 2;
        }
    }
    @namespace(penstroke#stem) {
        @dictionary {
            point > center {
                xTranslate: 160 + extraX;
            }
        }
    }
    @namespace(penstroke#bar) {
        @dictionary {
            point:i(0) > center {
                xTranslate: 220 + extraX;
            }
        }
        @dictionary {
            point:i(1) > center {
                xTranslate: 65 + extraX;
            }
        }
    }
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(0) > center {
                xTranslate: 75 + extraX;
            }
        }
    }
}

@namespace("glyph#dvI") {
    @namespace(penstroke#sShape) {
        @dictionary {
            point:i(0) center {
                xTranslate: 30;
                yTranslate: 0;
            }
            point:i(1) center {
                xTranslate: 20;
                yTranslate: 0;
            }
            point:i(-3) center {
                xTranslate: 15;
                yTranslate: 0;
            }
            point:i(-2) center {
                xTranslate: -10;
                yTranslate: 0;
            }
            point:i(-1) center {
                xTranslate: -10;
                yTranslate: 0;
            }
        }
    }
    
    @namespace(penstroke#verticalConnection) {
        @dictionary {
            point:i(0) left {
                offset: Vector 0 -25;
            }
        }
        point:i(0) left {
            in: on + Polar 100 deg 20;
        }
    }
}

@namespace("glyph#dvKHA") {
    /* moving it back into the viewport */
    @dictionary{
        point > center {
            extraX: 50;
            xTranslate: extraX;
        }
    }
    
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(0) center {
                xTranslate: extraX + 95;
            }
            point:i(1) center {
                target: spiralBow:children[0]:right:on:x;
                pinTo: Vector (target-_on:x) 0;
            }
        }
    }
    @namespace("penstroke#spiralBow") {
        @namespace("point:i(-1), point:i(-2), point:i(-3), point:i(-4), point:i(-5)") /*";*/ {
            @dictionary {
                center {
                    spiralOffset: 170;
                    individualOffset: 0;
                    xTranslate: extraX + spiralOffset + individualOffset;
                }
            }
        }
        
        @dictionary {
            point:i(1) center{
                xTranslate: extraX + 60;
            }
            point:i(2) center {
                xTranslate: extraX + 90;
            }
            point:i(-5) center {
                individualOffset: 30
            }
            point:i(-4) center {
                individualOffset: -15
            }
            point:i(-3) center {
                individualOffset: -40
            }
            point:i(-2) center {
                individualOffset: -10
            }
            point:i(-1) center {
                individualOffset: 15;
            }
            point:i(-1) left,  point:i(-1) right{
                weightSummand: 5;
            }
        }
        
        point:i(2) left,  point:i(2) right{
            outTension: .9;
        }
        
        point:i(-4) left {
            inTension: 2;
            
        }
        
        point:i(-3) left {
            inTension: 1;
            outTension: 1;
        }
        point:i(-1) right {
            inTension: 1.5;
        }
        
    }
    @namespace("penstroke#stem") {
        @dictionary {
            point > center {
                stemFitComepensation: parent:right:onLength * 0.45;
            }
        }
    }
    @namespace("penstroke#bar") {
        @dictionary {
            point:i(0) > center {
                xTranslate: extraX + 320;
            }
        }
    }
}
@namespace("glyph#dvBHA") {
    @namespace("penstroke#bow") {
        @dictionary {
            point:i(1) > center{
                xTranslate: -15;
            }
            point:i(2) > center {
                xTranslate: 8;
            }
            point:i(-3) > center {
                xTranslate: 50;
            }
            point:i(-2) > center {
                xTranslate: 5;
            }
            point:i(-1) > center {
                xTranslate: -15;
            }
            
        }
        
        point:i(2) > left {
            inTension: 1.3;
            outTension: 1.8;
        }
        
        point:i(-2) > left{
            outTension: 2;
            inTension: 3;
        }
        point:i(-1) > left{
            inTension: .8;
            inDirIntrinsic: deg -3;
        }
    }
    @namespace("penstroke#stem") {
        @dictionary {
            point > center {
                xTranslate: 155;
            }
        }
    }
    @namespace("penstroke#bar") {
        @dictionary {
            point:i(0) > center {
                xTranslate: 210;
            }
            point:i(-1) > center {
                xTranslate: 90;
            }
        }
    }
}
@namespace("glyph#dvDA") {
    @dictionary {
        point > center {
            extraX: 110;
            xTranslate: extraX;
        }
    }
    @namespace(penstroke#bar) {
        @dictionary {
            point:i(0) center {
                xTranslate: extraX - 70;
            }
            point:i(-1) center {
                xTranslate: extraX + 50;
            }
        }
    }
    @namespace(penstroke#bow) {
        @dictionary {
            point:i(2) center {
                xTranslate: extraX - 40;
            }
        }
    }
    @namespace(penstroke#verticalConnection) {
        @dictionary {
            point:i(0) left {
                offset: Vector 0 -25;
            }
        }
        point:i(0) left {
            in: on + Polar 100 deg 20;
        }
    }
}
@namespace(glyph#dvDHA) {
    @dictionary {
        point > center {
            extraX: 110;
            xTranslate: extraX;
        }
    }
    @namespace(penstroke#upperBow) {
        @dictionary {
            point:i(-2) > center {
                xTranslate: -36 + extraX;
            }
            point:i(-1) > center {
                xTranslate: -30 + extraX ;
            }
        }
        point:i(-1) > right {
            inTension: .75;
        }
        point:i(0) > right {
            outTension: .9;
        }
    }
    @namespace(penstroke#lowerBow) {
        @dictionary {
            point:i(-2) > center {
                xTranslate: -36 + extraX ;
            }
        }
         @dictionary {
            point:i(0) > center {
                xTranslate: 20 + extraX;
            }
        }
    }
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(-1) > center {
                xTranslate: -85 + extraX;
            }
        }
    }
    @namespace(penstroke#leftBar) {
        @dictionary {
            /* move this 0 center x to upperBow -1 right x */ 
            point:i(0) > center {
                targetPoint: upperBow:children[-1];
                target: targetPoint:center:_on:x;
                rightOffset: (Polar targetPoint:right:onLength targetPoint:right:onDir):x;
                pinTo: Vector (target + rightOffset - this:_on:x) 0;
            }
            point:i(-1) > center {
                xTranslate: -30;
            }
        }
    }
    @namespace(penstroke#rightBar) {
        @dictionary {
            point:i(0) > center {
                xTranslate: 160 + extraX;
            }
            point:i(1) > center {
                xTranslate: 25 + extraX;
            }
        }
    
    }
}
@namespace(glyph#dvSSA) {
    @dictionary {
        point > center {
            extraX: 110;
            xTranslate: extraX;
        }
    }
    @namespace(penstroke#bow) {
        @dictionary {
            point:i(0) > center {
                xTranslate: 43 + extraX;
            }
            point:i(1) > center {
                xTranslate: 35 + extraX;
            }
        }
        point:i(0) > right{
            outTension: 2;
        }
        point:i(1) > right{
            outTension: 1;
            inTension: .9;
        }
    }
    @namespace(penstroke#bar) {
        @dictionary {
            point:i(0) > center {
                xTranslate: 180 + extraX;
            }
            point:i(-1) > center {
                xTranslate: -60  + extraX;
            }
        }
    }
}
