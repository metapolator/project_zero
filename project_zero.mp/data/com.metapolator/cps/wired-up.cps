/* set up this masters parameters */
@dictionary {
    point > * {
        baseMaster: S"master#base";
    }
    point > center {
        skeleton: base;
    }
}

/** pin-to pattern **/
@dictionary {
    glyph#dvA penstroke#lowerBow point > center
  , glyph#dvA penstroke#horizontalConnection point>center
  , glyph#dvA penstroke#stem  point>center
  , glyph#dvI penstroke#bubble point > center
  , glyph#dvI penstroke#appendix point:i(1) > center
  , glyph#dvI penstroke#verticalConnection point > center
  {
        _on: transform * translate * skeleton:on;
        _in: transform * translate * skeleton:in;
        _out: transform * translate * skeleton:out;
        pinTo: Vector 0 0;
    }
}

  glyph#dvA penstroke#lowerBow point > center
, glyph#dvI penstroke#bubble point > center
, glyph#dvI penstroke#appendix point:i(1) > center
{
    on: _on + pinTo;
    in: _in + pinTo;
    out: _out + pinTo;
}
/**/

/*********************
 * general setup that pins point to positions etc. *
                             ***********************/
@namespace("glyph#dvA") {
    @dictionary{
        point > *{
            bowConnection: parent:parent:parent[S"#bowConnection"];
            lowerBow: parent:parent:parent[S"#lowerBow"];
            upperBow: parent:parent:parent[S"#upperBow"];
            stem: parent:parent:parent[S"#stem"];
            bar: parent:parent:parent[S"#bar"];
        }
    }
    @namespace(penstroke#bowConnection) {
        point > left, point > right {
            onLength: (upperBow:children[0]:left:on:y - lowerBow:children[-1]:left:on:y) / 2;
        }
    }
    @namespace(penstroke#horizontalConnection) {
        point:i(0) > center {
            on: Vector stem:children[0]:center:on:x _on:y;
        }
        point:i(1) > center {
            on: Vector lowerBow:children[-3]:center:on:x _on:y;
        }
    }
    @namespace(penstroke#stem) {
        point:i(-1) > center {
            on: Vector _on:x bar:children[0]:center:on:y;
        }
    }
   
    @namespace(penstroke#lowerBow) {
        @namespace("point:i(0), point:i(1)") {/* " ;*/
            @dictionary{
                * {
                    dropScale: 1;
                }
                center {
                    heightFactor: dropScale;
                    widthFactor: dropScale;
                }
                left, right {
                    weightFactor: dropScale;
                }
            }
        }
    }
}

@namespace("glyph#dvI") {
    @dictionary{
        point>* {
            sShape: parent:parent:parent[S"#sShape"];
        }
    }
    @namespace(penstroke#bubble) {
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
                target: sShape[S"point:i(-1) left"]:on;/*:children[-1]:left:*/
                pinTo: target - parent:parent[S"point:i(-1) center"]:_on;
                
                heightFactor: bubbleScale;
                widthFactor: bubbleScale;
            }
            point > left, point > right {
                weightFactor: bubbleScale;
            }
        }
        
    }
    @namespace(penstroke#appendix) {
        @dictionary {
            point:i(1) > center {
                pinTo: sShape:children[-1]:center:on - parent:parent:children[1]:center:_on
            }
        }
        point:i(1) > center {
            /* point:i(0) is positioned relative from here */
            in: on + Polar 25 deg 250;
        }
        
        point:i(0)>center{
            on: parent:parent:children[1]:center:on + Polar 128 deg 235;
            out: parent:parent:children[1]:center:on + Polar 90 deg 242;
        }
    }
    @namespace(penstroke#sShape) {}
    @namespace(penstroke#verticalConnection) {
        @dictionary {
            point > center {
                target: sShape[S"point:i(0) center"]:on;
                rightIntrinsic: Polar parent:right:onLength parent:right:onDir;
                top:  parent:parent:parent[S"#bar point:i(0) center"]:on;
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
