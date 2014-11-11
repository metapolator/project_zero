/* set up this masters parameters */
@dictionary {
    point > center {
        widthFactor: 0.5;
    }
    point > left, point > right {
        weightFactor:  .2;
    }
}

@namespace("
  glyph#dvI penstroke#bubble point
, glyph#dvDA penstroke#bubble point
, glyph#dvA penstroke#lowerBow point:i(0)
, glyph#dvA penstroke#lowerBow point:i(1)
") {
    @dictionary {
        * {
            uniformScale: .5;
        }
    }
}

@namespace("
, glyph#a penstroke#stem point:i(-1)
, glyph#a penstroke#stem  point:i(-2)
, point.drop
") {
    @dictionary {
        * {
            uniformScale: .35;
        }
    }
}
@namespace("
    glyph#s point.drop
  , glyph#i penstroke#dot point
") {
    @dictionary {
        * {
            uniformScale: .45;
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
            serifLength: stemWidth * 1.4;
        }
    }
}

/********************
 * compensate for each skeleton/weight setup *
 *                           *****************/


@namespace("glyph#dvA") {
    @namespace(penstroke#upperBow) {
        point:i(0)>right {
            outTension: .9;
        }
    }
    @namespace(penstroke#lowerBow) {
        /* the drop */
        @namespace("point:i(0), point:i(1)") {/* " ; */
            @dictionary{
                center {
                    yTranslate: 47.5;
                }
            }
        }
        @dictionary{
            point:i(2) > center{
                xTranslate: 5;
            }
        }
        point:i(2) > left{
           inTension: 1.3;
        }
        point:i(1) > right {
            outTension: .9;
        }
        point:i(2) > right {
            inTension: .9;
        }
    }
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(0) > center {
                xTranslate: -45;
            }
        }
    }
}

@namespace("glyph#dvI") {
    @namespace(penstroke#sShape) {
        @dictionary {
            point:i(-3) center {
                xTranslate: 20;
                yTranslate: -10;
            }
        }
    }
    @namespace(penstroke#verticalConnection) {
        @dictionary {
            point:i(0) left {
                offset: Vector 0 14;
            }
        }
    }
}
@namespace("glyph#dvKHA") {
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(0) center {
                xTranslate: -27;
            }
        }
    }
    @namespace("penstroke#spiralBow") {
        @dictionary {
            point:i(2) > center {
                xTranslate: 5;
            }
            
            point:i(-5) > center {
                xTranslate: 2.5;
            }
            point:i(-2) > center {
                xTranslate: 1;
            }
            point:i(-2) > left,  point:i(-2) > right,
            point:i(-1) > left,  point:i(-1) > right {
                weightSummand: 1;
            }
        }
        
        point:i(2) > left{
            outTension: 1.15;
        }
        
        
        point:i(-2) > left {
            outTension: 1;
        }
        point:i(-2) > right {
            outTension: 1;
        }
        point:i(-1) > left {
            inTension: 1;
            inDirIntrinsic: deg -9;
        }
    }
    
    @namespace("penstroke#stem") {
        @dictionary {
            point > center {
                stemFitComepensation: -3;
            }
        }
        point:i(1) > left {
            outTension: 15;
            outDirIntrinsic: deg -12;
        }
        point:i(2) > left {
            inTesnsion: 15;
            inDirIntrinsic: deg 12;
        }
    }
}

@namespace("glyph#dvBHA") {
    @namespace("penstroke#bow") {
        @dictionary {
            point:i(-3) > center{
                xTranslate: 5;
            }
        }
        
        point:i(-2) > right {
            inTension: 1.4;
        }
        point:i(-4) > right {
            outTension: 1.4;
        }
        
        point:i(2) > left {
            inTension: 1.15;
        }
    }
}
@namespace("glyph#dvDA") {
    @namespace(penstroke#verticalConnection) {
        @dictionary {
            point:i(0) left {
                offset: Vector 0 10;
            }
        }
        point:i(0) left {
            in: on + Polar 25 deg -10;
        }
    }
}
@namespace(glyph#dvDHA) {
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(-1) > center {
                xTranslate: 35.5;
            }
        }
    }
    @namespace(penstroke#upperBow) {
        point:i(0) > left {
            outTension: 1.1;
        }
    }
    @namespace(penstroke#upperBow) {
        point:i(-2) > left {
            outTension: 1.3;
        }
        @dictionary {
            point:i(-2) > center {
                xTranslate: -6;
            }
        }
    }
    @namespace(penstroke#lowerBow) {
        point:i(-2) > left {
            outTension: 4;
        }
    }
}
@namespace(glyph#dvSSA) {
    @namespace(penstroke#bow) {
        @dictionary{
            point:i(0) > right, point:i(0) > left {
                weightSummand: 3;
            }
            point:i(0) > center {
                yTranslate: -18;
            }
            point:i(1) > center {
                xTranslate: -2.5;
            }
            point:i(2) > center {
                yTranslate: -23;
            }
        }
        point:i(0) left {
            outTension: 1.2
        }
        point:i(1) left {
            inTension: .8;
            outTension: 1.2;
        }
        
        point:i(2) left {
            inTension: .7;
        }
        
        point:i(0) right {
            outTension: 1.2;
        }
        
        point:i(1) right {
            inTension: 1;
            outTension: 1.2;
        }
    }
}

@namespace("glyph#a") {
    @namespace("penstroke#stem") {
        @dictionary {
            point:i(-3) > center {
                xTranslate: 5;
            }
            point:i(-2) > center,
            point:i(-1) > center {
                yTranslate: 25;
            }
            point:i(0) > left,
            point:i(0) > right {
                weightSummand: 1.5;
            }
        }
        point:i(0) > right{
            outDirIntrinsic: parent:left:outDirIntrinsic;
        }
        
        point:i(-4) > right {
            outTension: .6;
        }
        point:i(-3) > left {
            outTension: 1.3;
            inTension: 1.15;
        }
        point:i(-3) > right {
            outTension: 1;
            inTension: .92;
        }
        point:i(-2)>left {
            inTension: 1;
        }
        point:i(-2)>right {
            inTension: 1.5;
        }
    }
    @namespace("penstroke#bowl") {
        @dictionary {
            point:i(2) > center {
                xTranslate: -15;
            }
        }
        
        point:i(0) > left,
        point:i(0) > right {
            outTension: 1;
        }
        
        point:i(1) > left {
            inTension: 1.1;
            outTension: 1.5;
        }
        point:i(2) > right {
            outTension: 1.1;
        }
    }
}

@namespace(glyph#s) {
    @namespace(penstroke#sShape) {
        @dictionary {
            point.drop.bottom > center {
                yTranslate: -20;
                xTranslate: 5;
            }
            point.horizontal.bottom > center {
                xTranslate: -11;
            }
            point.vertical.bottom > center{
                xTranslate: 10;
                yTranslate: 5;
            }
            
            point.vertical.top > center{
                xTranslate: -10;
                yTranslate: -5;
            }
            point.horizontal.top > center {
                xTranslate: 9;
            }
            point.drop.top > center {
                yTranslate: 20;
            }
        }
        point.horizontal.bottom > left {
            inTension: .65;
        }
        point.horizontal.bottom > right {
            inTension: .75;
        }
        
        point.horizontal.top > right {
            inTension: .65;
        }
        point.horizontal.top > left {
            inTension: .75;
        }
        
    }
}
