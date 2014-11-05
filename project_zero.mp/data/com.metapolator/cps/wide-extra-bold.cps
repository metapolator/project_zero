/* set up this masters parameters */
@dictionary {
    point > center {
        widthFactor: 1.3;
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
    @namespace(penstroke#lowerBow) {
        @namespace("point:i(0), point:i(1)") {/* " ;*/
            @dictionary{
                * {
                    uniformScale: 1.2;
                }
                center {
                    yTranslate: -25;
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
                xTranslate: 55;
            }
        }
    }
}

@namespace("glyph#dvI") {
    @namespace(penstroke#sShape) {
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
    @namespace(penstroke#verticalConnection) {
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
@namespace("glyph#dvKHA") {
    @namespace("penstroke#spiralBow") {
        @namespace("point:i(-1), point:i(-2), point:i(-3), point:i(-4), point:i(-5)") /*";*/ {
            @dictionary {
                center {
                    spiralOffset: 20;
                    xTranslate: spiralOffset;
                }
            }
        }
        @dictionary {
            point:i(1) > center,
            point:i(2) > center {
                xTranslate: 10;
            }
            point:i(-1) > left{
                weightSummand: 5;
            }
        }
    }
    @namespace("penstroke#bowConnection") {
        @dictionary {
            point:i(0) > center{
                xTranslate: 30;
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
            point:i(0) left {
                offset: Vector 0 -10;
            }
        }
        point:i(0) left {
            in: on + Polar 100 deg 30;
        }
    }
}
