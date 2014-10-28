/* set up this masters parameters */
@dictionary {
    point > * {
        baseMaster: S"master#base";
    }
    
    point > left, point > right {
        weightFactor: 0.2;
    }
    
    point > center {
        widthFactor: .5;
        skeleton: base;
    }
}

/*
 * TODO: xTranslate and yTranslate are good, because they affect the
 * control points as well. But what I really need is a semantic way to
 * pin one point to another (or some calculated position)
 * When done right, the glyph should behave right when scaling the skeleton
 * and also much better when changing the weight.
 * 
 * Fixing points for skeleton transformations should yield in a big speed up.
 */

@namespace("glyph#dvI") {
    /* the bow */
    @namespace(penstroke:i(0)) {
        
        point:i(1) left, point:i(1) right {
            onLength: 25;
        }
        @dictionary {
            
            point:i(0) center {
                xTranslate: 20;
                yTranslate: -100;
            }
            
            point:i(1) center {
                xTranslate: 15;
                yTranslate: -53;
            }
        }
        
        point:i(2) center {
            on: parent:parent:parent:children[2]:children[6]:left:on;
        }
        point:i(2) right {
            inDir: deg 180 + parent:parent:parent:children[2]:children[6]:left:inDir;
        }
        point:i(2) left {
            inDir: deg 180 + parent:parent:parent:children[1]:children[1]:right:inDir;
            inTension: 1.5;
        }
        
    }
    /* the end stroke of the bow */
    @namespace(penstroke:i(1)) {
        @dictionary {
            point:i(1) center{
                xTranslate: -2;
                yTranslate: 7;
            }
        }
        @dictionary {
            point:i(0) center {
                yTranslate: 40;
                xTranslate: -15;
            }
        }
        
        point:i(1)>*{
            inTension:1.2;
            inDir: deg 75;
        }
        point:i(0)>*{
            outTension:1.2;
            outDir: deg 35;
        }
    }
    /* the s shape */
    @namespace(penstroke:i(2)) {
        @dictionary {
            point:i(4) center {
                xTranslate: 40;
                yTranslate: -10;
            }
        }
    }
    
    /* the vertical connection */
    @namespace(penstroke:i(3)) {
        @dictionary {
            point center{
                pinX: parent:parent:parent:children[2]:children[0]:center:on:x - parent:parent:children[1]:right:onLength;
            }
        }
        point center {
            on: Vector pinX (transform * translate * skeleton:on):y  + offset;
            in: Vector pinX (transform * translate * skeleton:in):y;
            out: Vector pinX (transform * translate * skeleton:out):y;
        }
        
        point:i(0) center {
            on: Vector pinX (parent:parent:parent:children[2]:children[0]:center:on:y + 5);
        }
        @dictionary {
            point>*{
                offset: Vector 0 0;
            }
            point:i(0) left {
                offset: Vector 0 10;
            }
            point:i(1) center {
                offset: Vector 0 5;
            }
        }
        
        point>* {
            on: Polar onLength onDir + parent:center:on + offset;
        }
    }
}
