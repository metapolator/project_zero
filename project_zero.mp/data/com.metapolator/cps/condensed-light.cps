/* set up this masters parameters */
@dictionary {
    point > center {
        widthFactor: 0.5;
    }
    point > left, point > right {
        weightFactor:  .2;
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
                    dropScale: .5;
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
    @namespace(penstroke#bubble) {
        @dictionary{
            point > * {
                bubbleScale: .5;
            }
        }
    }
    
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
