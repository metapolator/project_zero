/* set up this masters parameters */
@dictionary {
    point > center {
        widthFactor: 0.7;
    }
    point > left, point > right {
        weightFactor: 1.5;
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
            on: parent:parent:children[-1]:left:on;
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
                    dropScale: 1.2;
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
    /* the bubble */
    @dictionary{
        penstroke#bubble point > * {
            bubbleScale: 1;
        }
    }
    
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
