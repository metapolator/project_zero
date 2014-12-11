@import 'wired-up.cps';
@import 'global.cps';

/* set up this masters parameters */
@dictionary {
    point > center, outline > spot  {
        widthFactor: 1.3;
    }
    point > left, point > right, outline > spot {
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
, glyph#j penstroke#dot point
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

@dictionary {
    point > * {
        serifLength: stemWidth / 4;
    }
}
/********************
 * compensate for each skeleton/weight setup *
 *                           *****************/
 
@namespace("glyph#dvA") {
    @namespace(penstroke#lowerBow) {
        @namespace("point:i(0), point:i(1)") {/* " ;*/
            @dictionary{
                center {
                    yTranslate: -30;
                }
            }
        }
        point:i(1) > left {
            outTension: 2;
            inTension: 2;
        }
    }
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(0) > center {
                xTranslate: 71.5;
            }
        }
    }
}

@namespace("glyph#dvI") {
    @namespace(penstroke#sShape) {
        @dictionary {
            point:i(0) center {
                xTranslate: 36;
                yTranslate: 8.4;
            }
        
            point:i(1) center {
                xTranslate: 0;
                yTranslate: 8.4;
            }
            
            point:i(2) center {
                xTranslate: 12;
                yTranslate: 0;
            }
            
            point:i(-3) center {
                xTranslate: 18;
                yTranslate: -6;
            }
            
            point:i(-2) center {
                xTranslate: 18;
                yTranslate: 0;
            }
            
            point:i(-1) center {
                xTranslate: -36;
                yTranslate: 18;
            }
        }
        point:i(2) left {
            inTension: 1.9;
            outTension: 1.9;
        }
        point:i(-3) right {
            inTension: 1.7;
        }
        
        point:i(-1) center {
            in: on + Polar 15 deg 342;
        }
    }
    @namespace(penstroke#verticalConnection) {
        @dictionary {
            point:i(0) left {
                offset: Vector 0 -10;
            }
        }
        point:i(0) > left {
            inDir: deg 160;
        }
    }
}
@namespace("glyph#dvKHA") {
    @namespace("penstroke#spiralBow") {
        @namespace("point:i(-1), point:i(-2), point:i(-3), point:i(-4), point:i(-5)") /*"*/ {
            @dictionary {
                center {
                    spiralOffset: 26;
                    xTranslate: spiralOffset;
                }
            }
        }
        @dictionary {
            point:i(1) > center,
            point:i(2) > center {
                xTranslate: 13;
            }
            point:i(-1) > left{
                weightSummand: 5;
            }
        }
    }
    @namespace("penstroke#bowConnection") {
        @dictionary {
            point:i(0) > center{
                xTranslate: 39;
            }
            point:i(1) center {
                target: spiralBow:children[0]:right:on:x;
                pinTo: Vector (target-_on:x) 0;
            }
        }
    }
}
@namespace("glyph#dvDA") {
    @namespace(penstroke#verticalConnection) {
        @dictionary {
            point:i(0) > left {
                offset: Vector 0 -10;
            }
        }
        point:i(0) > left {
            inDir: deg 200;
        }
    }
}
@namespace("glyph#dvDHA") {
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(-1) > center {
                xTranslate: -53;
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
        }
    }
}
@namespace("glyph#a") {
    @namespace(penstroke#stem) {
        @dictionary {
            point:i(0)>right{
                weightSummand: 5;
            }
        }
        point:i(-2)>left {
            inTension: 2;
        }
    }
    @namespace(penstroke#bowl) {
        @dictionary {
            point:i(0)>center{
                xTranslate: 4;
            }
        }
        point:i(1)>right{
            outTension: .75;
        }
    }
}

@namespace(glyph#h, glyph#n) {
    @namespace("penstroke#arch") {
        @dictionary {
            /* move all points, we want to make it wider here*/
            point > center {
                origin: penstroke:children[-1]:center:_on:x;
                target: stem:children[0]:right:on:x;
                pinTo: Vector (target - origin) 0;
            }
        }
        point:i(-1) > right,  point:i(-1) > left {
            inTension: 1.6;
            inDirIntrinsic: deg -13;
        }
        point:i(-2) > right, point:i(-2) > left {
            outTension: 1;
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
                xTranslate: 15 + extraX;
            }
            point.drop.top > center {
                xTranslate: 33 + extraX;
            }
            point.horizontal.bottom > center {
                xTranslate: -7.5 + extraX;
            }
            point.drop.bottom > center {
                xTranslate: -15 + extraX;
                yTranslate: -8;
            }
        }
        point.drop.bottom.fixation > left {
            outTension: 4;
        }
        point.vertical.bottom > left {
            outTension: 2.3;
            inTension: 2.3;
        }
        point.vertical.top > right {
            inTension: 2.3;
            outTension: 2.3;
        }
        point.drop.top.fixation > right{
            inTension: 3.5;
        }
    }
}

@namespace("glyph#i,glyph#j") {
    @namespace("penstroke#dot") {
        @dictionary{
            point > center {
                dotFixation: penstroke:children[-1]:skeleton:on;
            }
        }
    }
}
@namespace("glyph#j") {
    @dictionary{
        point>center{
            extraX: 110;
            xTranslate: extraX;
        }
    }
}

@namespace(glyph#b) {
    @namespace(outline#terminal) {
        @dictionary {
            spot.bridge {
                _y: base:on:y;
                _x: -30 + _xRef:x;
            }
        }
    }
}
@namespace(glyph#c) {
    @namespace("penstroke#cShape") {
        point.drop.fixation > right {
            inTension: 1.3;
        }
    }
}

@namespace(glyph#g) {
    @namespace("penstroke#ear") {
        @dictionary {
            point.drop>center {
                yTranslate: -10;
            }
            point.horizontal>center {
                xTranslate: 5;
            }
            point.to-base>center {
                yTranslate: 8;
            }
        }
    }
    @namespace("penstroke#loop") {
        point.vertical.upper.left > left{
            outTension: 1.1;
        }
        
        point.vertical.lower.left > left{
            inTension: 1.7;
        }
    }
}
