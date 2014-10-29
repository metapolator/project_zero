/* set up this masters parameters */
@dictionary {
    point > center {
        widthFactor: 0.5;
    }
    point > left, point > right {
        weightFactor: 0.2;
    }
}

/********************
 * compensate for each skeleton/weight setup *
 *                           *****************/

@namespace("glyph#dvI") {
    /* the bubble */
    @dictionary{
        penstroke:i(0) point > * {
            bubbleScale: .5;
        }
    }
    
    /* the s shape */
    @namespace(penstroke:i(2)) {
        @dictionary {
            point:i(-3) center {
                xTranslate: 40;
                yTranslate: -10;
            }
        }
    }
    
    /* the vertical connection */
    @namespace(penstroke:i(3)) {
        @dictionary {
            point:i(0) left {
                offset: Vector 0 14;
            }
        }
    }
}
