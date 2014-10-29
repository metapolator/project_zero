/* set up this masters parameters */
@dictionary {
    point > center {
        widthFactor: 1.3;
    }
    point > left, point > right {
        weightFactor: 1.5;
    }
}

/********************
 * compensate for each skeleton/weight setup *
 *                           *****************/

@namespace("glyph#dvI") {
    /* the bubble */
    @dictionary {
        penstroke:i(0) point > * {
            bubbleScale: 1;
        }
    }
    /* the s shape */
    @namespace(penstroke:i(2)) {
        @dictionary {
            point:i(0) center {
                xTranslate: 30;
                yTranslate: 7;
            }
        
            point:i(1) center {
                xTranslate: 0;
                yTranslate: 7;
            }
            
            point:i(2) center {
                xTranslate: 10;
                yTranslate: 0;
            }
            
            point:i(-3) center {
                xTranslate: 15;
                yTranslate: -5;
            }
            
            point:i(-2) center {
                xTranslate: 15;
                yTranslate: 0;
            }
            
            point:i(-1) center {
                xTranslate: -30;
                yTranslate: 15;
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
            in: on + Polar 20 deg 344;
        }
    }
    /* the vertical connection */
    @namespace(penstroke:i(3)) {
        @dictionary {
            point:i(0) left {
                offset: Vector 0 -10;
            }
        }
        point:i(0) left {
            in: on + Polar 100 deg 0;
        }
    }
}
