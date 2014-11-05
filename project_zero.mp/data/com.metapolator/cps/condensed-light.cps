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
") {
    @dictionary {
        * {
            uniformScale: .5;
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
                * {
                    uniformScale: .5;
                }
                center {
                    yTranslate: 95;
                }
            }
        }
        @dictionary{
            point:i(2) > center{
                xTranslate: 10;
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
                xTranslate: -90;
            }
        }
    }
}

@namespace("glyph#dvI") {
    @namespace(penstroke#sShape) {
        @dictionary {
            point:i(-3) center {
                xTranslate: 40;
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
                xTranslate: -54;
            }
        }
    }
    @namespace("penstroke#spiralBow") {
        @dictionary {
            point:i(2) > center {
                xTranslate: 10;
            }
            
            point:i(-5) > center {
                xTranslate: 5;
            }
            point:i(-2) > center {
                xTranslate: 2;
            }
            point:i(-2) > left,  point:i(-2) > right,
            point:i(-1) > left,  point:i(-1) > right{
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
                xTranslate: 10;
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
                xTranslate: 71;
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
                xTranslate: -12;
            }
        }
    }
    
    @namespace(penstroke#lowerBow) {
        point:i(-2) > left {
            outTension: 4;
        }
    }
}
