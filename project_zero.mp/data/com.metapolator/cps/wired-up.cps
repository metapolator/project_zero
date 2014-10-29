/* set up this masters parameters */
@dictionary {
    point > * {
        baseMaster: S"master#base";
    }
    point > center {
        skeleton: base;
    }
}

/*********************
 * general setup that pins point to positions etc. *
                             ***********************/

@namespace("glyph#dvI") {
    /* the bubble */
    @namespace(penstroke:i(0)) {
        @dictionary {
            /* this makes the bubble largely independed from the rest of 
             * the width/weigth setup, use 1 for the original size
             */
            point > * {
                bubbleScale: 1;
            }
            point > center {
                /* calculate the unpinned location, so we can calculate
                 * the offset to move
                 */
                _on: transform * translate * skeleton:on;
                _in: transform * translate * skeleton:in;
                _out: transform * translate * skeleton:out;
                targetIndex: parent:parent:parent:children[2]:children:length - 1;
                target: parent:parent:parent:children[2]:children[targetIndex]:left:on;
                pinTo: target - parent:parent:children[2]:center:_on;
                heightFactor: bubbleScale;
                widthFactor: bubbleScale;
            }
            point > left, point > right {
                weightFactor: bubbleScale;
            }
        }
        point > center {
            on: _on + pinTo;
            in: _in + pinTo;
            out: _out + pinTo;
        }
    }
    /* the end stroke of the bubble */
    @namespace(penstroke:i(1)) {
        @dictionary {
            point:i(1) > center {
                _on: transform * translate * skeleton:on;
                _in: transform * translate * skeleton:in;
                _out: transform * translate * skeleton:out;
                change: parent:parent:parent:children[2]:children[6]:center:on - parent:parent:children[1]:center:_on
            }
        }
        /* point:i(1) is positioned relative from here */
        point:i(1) > center {
            on: _on + change;
            in: on + Polar 25 deg 250;
            out: _out + change;
        }
        
        point:i(0)>center{
            on: parent:parent:children[1]:center:on + Polar 128 deg 235;
            out: parent:parent:children[1]:center:on + Polar 90 deg 242;
        }
    }
    /* the s shape */
    @namespace(penstroke:i(2)) {}
    
    /* the vertical connection to from the S shape to the bar */
    @namespace(penstroke:i(3)) {
        @dictionary {
            point > center {
                target: parent:parent:parent:children[2]:children[0]:center:on;
                rightIntrinsic: Polar parent:right:onLength parent:right:onDir;
                /* children[4] is the horizontal bar */
                top:  parent:parent:parent:children[4]:children[0]:center:on;
                _on: transform * translate * skeleton:on;
                _in: transform * translate * skeleton:in;
                _out: transform * translate * skeleton:out;
            }
        }
        point:i(1) > center {
            on: Vector (target:x - rightIntrinsic:x)  top:y;
        }
        point:i(0) > center {
            on: Vector (target:x - rightIntrinsic:x) (target:y - rightIntrinsic:y);
        }
        point > center {
            on: Vector (target:x - rightIntrinsic:x)  _on:y;
            in: Vector (target:x - rightIntrinsic:x) _in:y;
            out: Vector (target:x - rightIntrinsic:x) _out:y;
        }
        
        /* end inside of the s shape
         * these values may need change in the masters */
        point:i(0) > left {
            on: Polar onLength onDir + parent:center:on + offset;
            inDir: deg 160;
        }
        point:i(0) > right {
            in: on;
        }
    }
}
