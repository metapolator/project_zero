/* set up this masters parameters */
@dictionary {
    point > * {
        baseMaster: S"master#base";
    }
    point > center {
        skeleton: base;
    }
}

/***********
 * reusable patterns *
            **********/

/** pin-to pattern **/
@dictionary {
    glyph#dvA penstroke#lowerBow point > center
  , glyph#dvA penstroke#horizontalConnection point>center
  , glyph#dvA penstroke#stem  point>center
  , glyph#dvI penstroke#bubble point > center
  , glyph#dvI penstroke#appendix point:i(1) > center
  , glyph#dvI penstroke#verticalConnection point > center
  , glyph#dvKHA penstroke#stem point > center
  , glyph#dvKHA penstroke#upperBow point:i(-1) > center
  , glyph#dvKHA penstroke#bowConnection point:i(1) > center
  , glyph#dvBHA penstroke#bow point:i(0) > center
  , glyph#dvBHA penstroke#horizontalConnection point > center
  , glyph#dvBHA penstroke#stem point:i(-1) > center
  , glyph#dvDA penstroke#verticalConnection point > center
  , glyph#dvDA penstroke#bubble point > center
  , glyph#dvDA penstroke#appendix point:i(0) > center
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
, glyph#dvKHA penstroke#stem point > center
, glyph#dvKHA penstroke#upperBow point:i(-1) > center
, glyph#dvKHA penstroke#bowConnection point:i(1) > center
, glyph#dvBHA penstroke#bow point:i(0) > center
, glyph#dvBHA penstroke#horizontalConnection point > center
, glyph#dvBHA penstroke#stem point:i(-1) > center
, glyph#dvDA penstroke#bubble point > center
, glyph#dvDA penstroke#appendix point:i(0) > center
{
    on: _on + pinTo;
    in: _in + pinTo;
    out: _out + pinTo;
}

/** position the vertical connection as seen in dvI between bar and sShape
 * 
 * this requires:
 *    - the stroke to move must be named "verticalConnection"
 *    - verticalTargetStroke set to a penstroke element
 *    - bar set to the bar penstroke element
 *    - the glyph#{name} penstroke#verticalConnection point > center element
 *      must be present in the pin-to pattern dictionary, but not in the
 *      second rule of that.
 */

@namespace("
  glyph#dvI penstroke#verticalConnection
, glyph#dvDA penstroke#verticalConnection
") {
    @dictionary {
        point > center {
            target: verticalTargetStroke:children[0]:center:on;
            rightIntrinsic: Polar parent:right:onLength parent:right:onDir;
            top: bar:children[0]:center:on;
        }

        point:i(0) left {
            offset: Vector 0 0;
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
    
    /* end inside of the verticalTargetStroke
     * these values will probably need change in the masters
     */
    point:i(0) > left {
        on: Polar onLength onDir + parent:center:on + offset;
        inDir: deg 160;
    }
    point:i(0) > right {
        in: on;
    }
}

/** uniform scale **
 * this makes the penstroke independed from the rest of 
 * the width/weigth setup by scaling it uniformly
 * use 1 for the original size
 */
@namespace("
  glyph#dvA penstroke#lowerBow point:i(0)
, glyph#dvA penstroke#lowerBow point:i(1)

, glyph#dvI penstroke#bubble point
, glyph#dvDA penstroke#bubble point

") {
    @dictionary {
        * {
            uniformScale: 1;
        }
        center {
            heightFactor: uniformScale;
            widthFactor: uniformScale;
        }
        left, right {
            weightFactor: uniformScale;
        }
    }
}
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
}

@namespace("glyph#dvI") {
    @dictionary{
        point>* {
            sShape: glyph[S"#sShape"];
            bar: glyph[S"#bar"];
            glyph: parent:parent:parent;
            penstroke: parent:parent;
            verticalTargetStroke: sShape;
        }
    }
    @namespace(penstroke#bubble) {
        @dictionary {
            point > center {
                /* calculate the unpinned location, so we can calculate
                 * the offset to move
                 */
                target: sShape:children[-1]:left:on;
                pinTo: target - penstroke:children[-1]:center:_on;
            }
        }
        
    }
    @namespace(penstroke#appendix) {
        @dictionary {
            point:i(1) > center {
                target: sShape:children[-1]:left:on;
                reference: penstroke:children[1];
                rightIntrinsic: Polar reference:right:onLength reference:right:onDir;
                pinTo: target - reference:center:_on - rightIntrinsic;
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
}
@namespace("glyph#dvKHA") {
    @dictionary {
        point > *{
            bowConnection: parent:parent:parent[S"#bowConnection"];
            spiralBow: parent:parent:parent[S"#spiralBow"];
            upperBow: parent:parent:parent[S"#upperBow"];
            stem: parent:parent:parent[S"#stem"];
            bar: parent:parent:parent[S"#bar"];
            penstroke: parent:parent;
        }
    }
    
    @namespace("penstroke#upperBow") {
        @dictionary{
            point:i(-1) center {
                target: bar:children[-1]:left:on:y;
                yOff: (Polar parent:left:onLength parent:left:onDir):y;
                pinTo: Vector 0 (target - _on:y - yOff);
            }
        }
    }
    @namespace("penstroke#stem") {
        @namespace("point:i(1), point:i(2)") /*";*/ {
            right {
                in: on;
                out: on;
            }
        }
        @dictionary {
            point > center {
                target: spiralBow:children[-5]:right:on:x;
                reference: penstroke:children[0]:center:_on:x;
                pinTo: Vector (target - reference + stemFitComepensation) 0;
                /* There is no correct rule for this. I'm picking just 
                 * something that is roughly right.
                 */
                stemFitComepensation: parent:right:onLength/3
            }
        }
    }
}
@namespace("glyph#dvBHA") {
    @dictionary {
        point > *{
            bowConnection: parent:parent:parent[S"#bowConnection"];
            bow: parent:parent:parent[S"#bow"];
            stem: parent:parent:parent[S"#stem"];
            bar: parent:parent:parent[S"#bar"];
            penstroke: parent:parent;
        }
    }
    @namespace("penstroke#bow") {
        @dictionary {
            point:i(0) > center {
                target: penstroke:children[-3]:left:on:x;
                pinTo: Vector (target - _on:x) 0;
            }
        }
    }
    @namespace("penstroke#horizontalConnection") {
        @dictionary {
            point:i(-1) > center {
                target: bow:children[-3]:center:on:x;
                pinTo: Vector (target - _on:x) 0;
            }
            point:i(0) > center {
                target: stem:children[0]:center:on:x;
                pinTo: Vector (target - _on:x) 0;
            }
        }
    }
    @namespace("penstroke#stem") {
        @dictionary {
            point:i(-1) > center {
                target: bar:children[0]:center:on:y;
                pinTo: Vector 0 (target - _on:y);
            }
        }
    }
}
@namespace("glyph#dvDA") {
    @dictionary {
        point > *{
            glyph: parent:parent:parent;
            penstroke: parent:parent;
            verticalConnection: glyph[S"#verticalConnection"];
            bow: glyph[S"#bow"];
            stem: glyph[S"#stem"];
            bar: glyph[S"#bar"];
            verticalTargetStroke: bow;
        }
    }
    @namespace(penstroke#bubble){
        @dictionary {
            point > center {
                /* calculate the unpinned location, so we can calculate
                 * the offset to move
                 */
                target: bow:children[-1]:right:on;
                pinTo: target - penstroke:children[-1]:center:_on;
            }
        }
    }
    @namespace(penstroke#appendix) {
        @dictionary {
            point:i(0) > center {
                target: bow:children[-1]:right:on;
                reference: penstroke:children[0];
                rightIntrinsic: Polar reference:right:onLength reference:right:onDir;
                pinTo: target - reference:center:_on - rightIntrinsic;
            }
        }
        point:i(0) > center {
            /* point:i(1) is positioned relative from here */
            out: on + Polar 25 deg 300;
        }
        
        point:i(1) > center{
            on: penstroke:children[0]:center:on + Polar 128 deg 325;
            in: penstroke:children[0]:center:on + Polar 90 deg 316;
        }
    }
}
