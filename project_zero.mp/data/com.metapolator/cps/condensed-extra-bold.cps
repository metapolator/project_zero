@import 'wired-up.cps';
@import 'global.cps';

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
@namespace("
  glyph#a penstroke#stem point:i(-1)
, glyph#a penstroke#stem point:i(-2)
, point.drop
") {
    @dictionary {
        * {
            uniformScale: 1.15;
        }
    }
}
@namespace("
  glyph#dvA penstroke#lowerBow point:i(0)
, glyph#dvA penstroke#lowerBow point:i(1)
") {
    @dictionary{
        * {
            uniformScale: 1.2;
        }
    }
}
@namespace("
  glyph#i penstroke#dot point
") {
    @dictionary {
        * {
            uniformScale: 1.5;
        }
    }
}
@namespace("
    glyph#s point.drop
") {
    @dictionary {
        * {
            uniformScale: 1.25;
        }
    }
}
@namespace("
  glyph#d
, glyph#h
, glyph#n
, glyph#i
") {
    @dictionary {
        point > * {
            serifLength: stemWidth / 6;
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
            extraX: 105;
            xTranslate: extraX;
        }
    }
    
    @namespace(penstroke#lowerBow, penstroke#upperBow) {
        @dictionary {
            point:i(-3) > center {
                xTranslate: 21 + extraX;
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
                center {
                    xTranslate: -91 + extraX;
                    yTranslate: -25;
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
                xTranslate: 112 + extraX;
            }
        }
    }
    @namespace(penstroke#bar) {
        @dictionary {
            point:i(0) > center {
                xTranslate: 154 + extraX;
            }
        }
        @dictionary {
            point:i(1) > center {
                xTranslate: 45.5 + extraX;
            }
        }
    }
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(0) > center {
                xTranslate: 52.5 + extraX;
            }
        }
    }
}

@namespace("glyph#dvI") {
    @dictionary{
        point > center {
            extraX: 40;
            xTranslate: extraX;
        }
    }
    @namespace(penstroke#sShape) {
        @dictionary {
            point:i(0) center {
                xTranslate: 31 + extraX;
                yTranslate: 0;
            }
            point:i(1) center {
                xTranslate: 14 + extraX;
                yTranslate: 0;
            }
            point:i(-3) center {
                xTranslate: 10.5 + extraX;
                yTranslate: 0;
            }
            point:i(-2) center {
                xTranslate: -7 + extraX;
                yTranslate: 0;
            }
            point:i(-1) center {
                xTranslate: -7 + extraX;
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
            extraX: 35;
            xTranslate: extraX;
        }
    }
    
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(0) center {
                xTranslate: 66.5 + extraX;
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
                    spiralOffset: 119;
                    individualOffset: 0;
                    xTranslate: extraX + spiralOffset + individualOffset;
                }
            }
        }
        
        @dictionary {
            point:i(1) center{
                xTranslate: extraX + 42;
            }
            point:i(2) center {
                xTranslate: extraX + 63;
            }
            point:i(-5) center {
                individualOffset: 21
            }
            point:i(-4) center {
                individualOffset: -10.5
            }
            point:i(-3) center {
                individualOffset: -28
            }
            point:i(-2) center {
                individualOffset: -7
            }
            point:i(-1) center {
                individualOffset: 10.5;
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
                xTranslate: extraX + 224;
            }
        }
    }
}
@namespace("glyph#dvBHA") {
    @dictionary {
        point > center {
            extraX: 20;
            xTranslate: extraX;
        }
    }
    @namespace("penstroke#bow") {
        @dictionary {
            point:i(1) > center{
                xTranslate: -10.5 + extraX;
            }
            point:i(2) > center {
                xTranslate: 5.6 + extraX;
            }
            point:i(-3) > center {
                xTranslate: 35 + extraX;
            }
            point:i(-2) > center {
                xTranslate: 3.5 + extraX;
            }
            point:i(-1) > center {
                xTranslate: -10.5 + extraX;
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
                xTranslate: 108.5 + extraX;
            }
        }
    }
    @namespace("penstroke#bar") {
        @dictionary {
            point:i(0) > center {
                xTranslate: 147 + extraX;
            }
            point:i(-1) > center {
                xTranslate: 63 + extraX;
            }
        }
    }
}
@namespace("glyph#dvDA") {
    @dictionary {
        point > center {
            extraX: 77;
            xTranslate: extraX;
        }
    }
    @namespace(penstroke#bar) {
        @dictionary {
            point:i(0) center {
                xTranslate: extraX - 49;
            }
            point:i(-1) center {
                xTranslate: extraX + 35;
            }
        }
    }
    @namespace(penstroke#bow) {
        @dictionary {
            point:i(2) center {
                xTranslate: extraX - 28;
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
            extraX: 77;
            xTranslate: extraX;
        }
    }
    @namespace(penstroke#upperBow) {
        @dictionary {
            point:i(-2) > center {
                xTranslate: -25.2 + extraX;
            }
            point:i(-1) > center {
                xTranslate: -21 + extraX ;
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
                xTranslate: -25.2 + extraX ;
            }
        }
         @dictionary {
            point:i(0) > center {
                xTranslate: 14 + extraX;
            }
        }
    }
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(-1) > center {
                xTranslate: -59.5 + extraX;
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
                xTranslate: -21;
            }
        }
    }
    @namespace(penstroke#rightBar) {
        @dictionary {
            point:i(0) > center {
                xTranslate: 112 + extraX;
            }
            point:i(1) > center {
                xTranslate: 17.5 + extraX;
            }
        }
    
    }
}
@namespace(glyph#dvSSA) {
    @dictionary {
        point > center {
            extraX: 77;
            xTranslate: extraX;
        }
    }
    @namespace(penstroke#bow) {
        @dictionary {
            point:i(0) > center {
                xTranslate: 30.1 + extraX;
            }
            point:i(1) > center {
                xTranslate: 24.5 + extraX;
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
                xTranslate: 126 + extraX;
            }
            point:i(-1) > center {
                xTranslate: -42  + extraX;
            }
        }
    }
}
@namespace(glyph#a) {
    @dictionary {
        point > center {
            extraX: 77;
            xTranslate: extraX;
        }
    }
    @namespace(penstroke#stem){
        @dictionary {
            point:i(0) > center {
                xTranslate: 120 + extraX;
                yTranslate: 0;
            }
            
            point:i(0) > right{
                weightSummand: 3;
            }
            
            point:i(1) > center {
                xTranslate: 100 + extraX;
            }
            
            point:i(2) > center ,
            point:i(3) > center {
                xTranslate: 60 + extraX;
            }
            
            point:i(-1) > center,
            point:i(-2) > center{
                xTranslate: -25 + extraX;
            }
        }
        
        point:i(0)>right {
            outTension: 1;
        }
        point:i(1)>right{
            inTension: 1;
            outTension: .75;
        }
        
        point:i(1)>left,
        point:i(1)>right {
            sinTension: Infinity;
        }
        
    }
    @namespace(penstroke#bowl){
        @dictionary {
            point:i(2) > center{
                xTranslate: -15 + extraX;
            }
            point:i(1) > center{
                xTranslate: -10 + extraX;
            }
            point:i(0) > center{
                xTranslate: 10 + extraX;
            }
        }
    }
}
@namespace(glyph#d) {
    @dictionary {
        point > center {
            extraX: 100;
            xTranslate: extraX;
        }
    }
    @namespace(penstroke#stem) {
        @dictionary{
            point > center {
                xTranslate: 20 + extraX;
            }
        }
    }
    @namespace(penstroke#bowl) {
        @dictionary {
            
            point:i(1)>center {
                xTranslate: -10 + extraX;
            }
            point:i(2)>center{
                xTranslate: -28 + extraX;
            }
            point:i(-2)>center{
                xTranslate: -15 + extraX;
            }
        }
        
        point:i(1) > right {
            inTension: 3;
            outTension: 2.5;
        }
        point:i(-2) > right {
            outTension: 3;
            inTension: 2.5;
        }
    }
}

@namespace(glyph#h, glyph#n) {
    @dictionary {
        point > center {
            extraX: 77;
            xTranslate: extraX;
        }
    }
    @namespace("penstroke#arch") {
        @dictionary {
            /* move all points, we want to make it wider here*/
            point > center {
                origin: penstroke:children[-1]:center:_on:x;
                target: stem:children[0]:right:on:x;
                pinTo: Vector (target - origin) 0;
            }
        }
        point:i(-2) > left {
            inTension: 2.3;
            soutTension: 1;
        }
    }
    @dictionary{
        penstroke#bottomLeftSerif point.serif.bottom.right > center,
        penstroke#bottomRightSerif point.serif.bottom.left > center {
            serifLength: 0;
        }
    }
}


@namespace(glyph#e) {
    @dictionary {
        point > center {
            extraX: 77;
            xTranslate: extraX;
        }
    }
    @namespace("penstroke#stroke") {
        point:i(1) > left {
            inTension: 2.7;
            outTension: 2.7;
        }
        @dictionary{
            point:i(0) > center{
                xTranslate: 32 + extraX;
            }
            point:i(2) > center{
                xTranslate: -32 + extraX;
            }
        }
    }
}
@namespace(glyph#s) {
    @dictionary {
        point > * {
            xTranslate: extraX;
            extraX: 50;
        }
    }
    @namespace(penstroke#sShape) {
        @dictionary {
            point.horizontal.top > center {
                xTranslate: 25 + extraX;
            }
            point.drop.top > center {
                xTranslate: 25 + extraX;
                yTranslate: 5;
            }
            point.horizontal.bottom > center {
                xTranslate: -15 + extraX;
            }
            point.drop.bottom > center {
                xTranslate: -22 + extraX;
                yTranslate: -10;
            }
        }
    }
}
@namespace(glyph#i) {
    @dictionary {
        point > * {
            xTranslate: extraX;
            extraX: 50;
        }
    }
    @namespace("penstroke#dot") {
        @dictionary {
            point > center {
                dotFixation: penstroke:children[-1]:skeleton:on;
            }
        }
    }
}

@namespace(glyph#o) {
    @dictionary {
        point > center {
            xTranslate: extraX;
            extraX: 77;
        }
        point.horizontal > left {
            horizontalInnerTension: 2.7;
        }
        point.vertical > center {
           verticalXTranslate: 30;
        }
        penstroke#left point.vertical > center {
            xTranslate: -verticalXTranslate + extraX;
        }
        penstroke#right point.vertical > center {
            xTranslate: verticalXTranslate + extraX;
        }
    }
    penstroke#left point.horizontal.top > left {
        outTension: horizontalInnerTension;
    }
    penstroke#left point.horizontal.bottom > left {
        inTension: horizontalInnerTension;
    }
    penstroke#right point.horizontal.top > left {
        inTension: horizontalInnerTension;
    }
    penstroke#right point.horizontal.bottom > left {
        outTension: horizontalInnerTension;
    }
}
