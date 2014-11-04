/* set up this masters parameters */
@dictionary {
    point > center {
        widthFactor: 1.3;
    }
    point > left, point > right {
        weightFactor: 0.2;
    }
}

/********************
 * compensate for each skeleton/weight setup *
 *                           *****************/

@namespace("glyph#dvA") {
    @namespace(penstroke#upperBow) {
        point:i(1)>right, point:i(1)>left {
            inTension: .9;
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
                    yTranslate: 145;
                    xTranslate: 130;
                }
            }
        }
        @dictionary{
            point:i(2) > center{
                xTranslate: 20;
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
                xTranslate: -65;
            }
        }
    }
}

@namespace("glyph#dvI") {
    @namespace(penstroke#bubble) {
        @dictionary {
            point > * {
                uniformScale: .5;
            }
        }
    }
    @namespace(penstroke#sShape) {
        @dictionary {
            point:i(2) center {
                xTranslate: 15;
                yTranslate: 0;
            }
            point:i(-3) center {
                xTranslate: 15;
                yTranslate: 0;
            }
            
            point:i(-2) center {
                xTranslate: 34;
                yTranslate: 0;
            }
            
            point:i(-1) center {
                xTranslate: -20;
                yTranslate: 20;
            }
        }
        point:i(2) right{
            outTension: 1;
        }
        point:i(-1) center {
            in: on + Polar 20 deg 344;
        }
    }
    @namespace(penstroke#verticalConnection) {
        @dictionary {
            point:i(0) left {
                offset: Vector 0 3;
            }
        }
    }
}

@namespace("glyph#dvKHA") {
    @namespace(penstroke#upperBow){
        point:i(0) > left, point:i(0) > right{
            outTension: 1;
        }
        point:i(1) > left, point:i(1) > right{
            inTension: 1;
        }
    }

    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(0) > center {
                xTranslate: -70;
            }
        }
    }
    @namespace(penstroke#spiralBow) {
        point:i(-1) > left {
            inDirIntrinsic: deg -8;
        }
        point:i(2) > right {
            outTension: 0.9;
        }
    }
    @namespace("penstroke#stem") {
        @dictionary {
            point > center {
                stemFitComepensation: -3;
            }
            point:i(1) > center {
                yTranslate: 65;
            }
            point:i(2) > center {
                yTranslate: -45;
            }
        }
        
        point:i(1) > left {
            outTension: 2;
            outDirIntrinsic: deg -5;
        }
        point:i(2) > left {
            inTesnsion: 2;
            inDirIntrinsic: deg 5;
        }
    }
}
