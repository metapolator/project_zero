@import 'centreline-skeleton-to-symmetric-outline.cps';
@import 'lib/point-child-base.cps';
@import 'lib/single-inheritance.cps';
@import 'lib/weight.cps';
@import 'lib/scale.cps';

/* set up this masters parameters */
@dictionary {
    * {
        baseMaster: S"master#base";
    }
    point > center, outline > spot {
        skeleton: base;
    }
}

/* standard names */
@dictionary {
    point > *{
        master: parent:parent:parent:parent;
        glyph: parent:parent:parent;
        penstroke: parent:parent;
    }
    spot {
        master: parent:parent:parent;
        glyph: parent:parent;
        outline: parent;
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
  , glyph#dvDHA penstroke#upperBow point:i(-1) > center
  , glyph#dvDHA penstroke#stem point > center
  , glyph#dvDHA penstroke#leftBar point:i(0) > center /* used in the bold versions */
  , glyph#dvSSA penstroke#stem point > center
  , glyph#dvSSA penstroke#crossBar point:i(0) > center
  , glyph#a penstroke#bowl point > center
  , glyph#a penstroke#stem point:i(-1) > center
  , glyph#a penstroke#stem point:i(-2) > center
  , glyph#d penstroke#topSerif point:i(0)>center
  , glyph#d penstroke#topSerif point:i(-1)>center
  , glyph#d penstroke#bottomSerif point:i(0)>center
  , glyph#d penstroke#bottomSerif point:i(-1)>center
  , glyph#d penstroke#bowl point > center
  , point.serif > center
  , point.no-serif > center
  , glyph#h penstroke#arch point > center
  , glyph#n penstroke#arch point > center
  , glyph#e penstroke#bar point > center
  , glyph#e penstroke#stroke point:i(-1) > center
  , glyph#e penstroke#stroke point:i(-2) > center
  , point.drop > center
  , glyph#i penstroke#dot point > center
  , glyph#j penstroke#dot point > center
  , glyph#b penstroke#bowl point.to-stem > center
  , glyph#b penstroke#bowl point.top.horizontal > center
  , glyph#b penstroke#bowl point.connection>center
  , glyph#b penstroke#stem point.bottom>center
  , glyph#c penstroke#cShape point.outstroke > center
  , glyph#c penstroke#cShape point.horizontal.bottom > center
  , glyph#f penstroke#horizontalStroke point.left > center
  , glyph#g penstroke#ear point.to-base > center
    {
        pinTo: Vector 0 0;
        _on: transform * skeleton:on;
        _in: transform * skeleton:in;
        _out: transform * skeleton:out;
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
, glyph#dvDHA penstroke#upperBow point:i(-1) > center
, glyph#dvDHA penstroke#stem point > center
, glyph#dvDHA penstroke#leftBar point:i(0) > center /* used in condensed extra bold */
, glyph#dvSSA penstroke#stem point > center
, glyph#dvSSA penstroke#crossBar point:i(0) > center
, glyph#a penstroke#bowl point > center
, glyph#a penstroke#stem point:i(-1) > center
, glyph#a penstroke#stem point:i(-2) > center
, glyph#d penstroke#topSerif point:i(0)>center
, glyph#d penstroke#topSerif point:i(-1)>center
, glyph#d penstroke#bottomSerif point:i(0)>center
, glyph#d penstroke#bottomSerif point:i(-1)>center
, glyph#d penstroke#bowl point > center
, point.serif > center
, point.no-serif > center
, glyph#h penstroke#arch point > center
, glyph#n penstroke#arch point > center
, glyph#e penstroke#bar point > center
, glyph#e penstroke#stroke point:i(-1) > center
, glyph#e penstroke#stroke point:i(-2) > center
, point.drop > center
, glyph#i penstroke#dot point > center
, glyph#j penstroke#dot point > center
, glyph#b penstroke#bowl point.to-stem > center
, glyph#b penstroke#bowl point.top.horizontal > center
, glyph#b penstroke#bowl point.connection>center
, glyph#b penstroke#stem point.bottom>center
, glyph#c penstroke#cShape point.outstroke > center
, glyph#c penstroke#cShape point.horizontal.bottom > center
, glyph#f penstroke#horizontalStroke point.left > center
, glyph#g penstroke#ear point.to-base > center
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
            _on: (Polar length base:onDir) + offset;
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
        onDir: _on:angle;
        onLength: _on:length;
    }
    point:i(0) > right {
        inTension: Infinity;
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

@namespace("
, glyph#a penstroke#stem point:i(-1)
, glyph#a penstroke#stem point:i(-2)
, point.drop
, glyph#i penstroke#dot point
, glyph#j penstroke#dot point
") {
    @dictionary {
        * {
            uniformScale: 1;
        }
        center {
            scale: Scaling uniformScale uniformScale;
        }
        left, right {
            weightFactor: uniformScale;
        }
    }
}


/**
 * Point class bases setup of the simple serifs of this font
 */
@dictionary {
    point.serif > center,
    point.no-serif > center {
        origin: this:_on:x;
        moveX: 0;
        pinTo: Vector moveX 0;
    }
    point > * {
    /* should be defined within the masters*/
        serifLength: 0;
    }
    point.serif > center {
        _serifLength: serifLength;
    }
    point.no-serif > center {
        _serifLength: 0;
    }

    /* We'll need to set `referenceStroke` to the actual penstroke that
     * is the reference stroke of the serif.
     * 
     */
    point.serif.top > center, point.no-serif.top > center {
        target: referenceStroke[S"point.top"];
    }
    
    point.serif.bottom > center, point.no-serif.bottom > center {
        target: referenceStroke[S"point.bottom"];
    }
    
    point.serif.left > center, point.no-serif.left > center {
        moveX: target:left:on:x - origin - _serifLength;
    }
    point.serif.right > center, point.no-serif.right > center {
        moveX: target:right:on:x - origin + _serifLength;
    }
}


/*********************
 * general setup that pins point to positions etc. *
                             ***********************/
@namespace("glyph#dvA") {
    @dictionary{
        point > *{
            bowConnection: glyph[S"#bowConnection"];
            lowerBow: glyph[S"#lowerBow"];
            upperBow: glyph[S"#upperBow"];
            stem: glyph[S"#stem"];
            bar: glyph[S"#bar"];
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
            on: penstroke:children[1]:center:on + Polar 128 deg 235;
            out: penstroke:children[1]:center:on + Polar 90 deg 242;
        }
    }
}
@namespace("glyph#dvKHA") {
    @dictionary {
        point > *{
            bowConnection: glyph[S"#bowConnection"];
            spiralBow: glyph[S"#spiralBow"];
            upperBow: glyph[S"#upperBow"];
            stem: glyph[S"#stem"];
            bar: glyph[S"#bar"];
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
                inTension: Infinity;
                outTension: Infinity;
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
            bowConnection: glyph[S"#bowConnection"];
            bow: glyph[S"#bow"];
            stem: glyph[S"#stem"];
            bar: glyph[S"#bar"];
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
            verticalConnection: glyph[S"#verticalConnection"];
            bow: glyph[S"#bow"];
            stem: glyph[S"#stem"];
            bar: glyph[S"#bar"];
            verticalTargetStroke: bow;
        }
    }
    @namespace(penstroke#bubble) {
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
@namespace(glyph#dvDHA) {
    @dictionary {
        point > *{
            bowConnection: glyph[S"#bowConnection"];
            lowerBow: glyph[S"#lowerBow"];
            upperBow: glyph[S"#upperBow"];
            stem: glyph[S"#stem"];
            leftBar: glyph[S"#leftBar"];
            rightBar: glyph[S"#rightBar"];
        }
    }
    @namespace(penstroke#upperBow){
        /* fix -1 right y to leftBar 0 left y */
        @dictionary{
            point:i(-1) > center {
                target: leftBar:children[0]:left:on:y;
                reference: penstroke:children[-1];
                rightIntrinsic: (Polar reference:right:onLength reference:right:onDir):y;
                pinTo: Vector 0 (target - reference:center:_on:y - rightIntrinsic);
            }
            /* this moves the vertical extreme half the way that the
             * curve end was moved. FIXME: should I do this kind of compensation
             * more often? In this case the effect is small but there.
             */
            point:i(-2) > center {
                yTranslate: (penstroke:children[-1]:center:pinTo:y) / 2
            }
        }
    }
    @namespace(penstroke#stem) {
        /* fix all xses to lowerBow 0 right x */
        @dictionary{
            point > center {
                target: lowerBow:children[0]:right:on:x;
                reference: penstroke:children[0];
                leftIntrinsic: (Polar reference:left:onLength reference:left:onDir):x;
                pinTo: Vector (target - reference:center:_on:x - leftIntrinsic) 0;
            }
        }
    }
}
@namespace(glyph#dvSSA) {
    @dictionary {
        point > *{
            bow: glyph[S"#bow"];
            crossBar: glyph[S"#crossBar"];
            stem: glyph[S"#stem"];
            bar: glyph[S"#bar"];
        }
    }
    @namespace(penstroke#stem) {
        /* fix all xses to bow 0 right x */
        @dictionary {
            point > center {
                target: bow:children[0]:right:on:x;
                reference: penstroke:children[0];
                leftIntrinsic: (Polar reference:left:onLength reference:left:onDir):x;
                pinTo: Vector (target - reference:center:_on:x - leftIntrinsic) 0;
            }
        }
    }
    @namespace(penstroke#crossBar) {
        /* fix all crossBar 0 x and y to the stem
         * crossBar is a simple straight line, so we find the
         * ratio between x and y and apply the change of x to that function
         * to get the change of y
         */
        @dictionary{
            point:i(0) > center {
                pinX: stem:children[0]:center:on:x - this:_on:x;
                ratio: penstroke:children[1]:center:on - this:_on;
                pinY: pinX * ratio:y/ratio:x;
                pinTo: Vector pinX pinY;
            }

        }
    }
}

@namespace(glyph#a) {
    @dictionary {
        point > * {
            bowl: glyph[S"#bowl"];
            stem: glyph[S"#stem"];
        }
    }
    @namespace("penstroke#bowl") {
        /* fix the bowl 0 and -1 to the stem, where -1 center touches it */
        @dictionary {
            point:i(0) > center,
            point:i(-1) > center {
                target: stem:children[2]:left:on:x;
                origin: penstroke:children[-1]:center:_on:x;
                pinX: target - origin;
                pinTo: Vector pinX 0;
            }
        }
    }
    @namespace("penstroke#stem") {
        @dictionary {
            /* fix the custom scaled bowl to the stem*/
            point:i(-2) > center,
            point:i(-1) > center {
                /* this is where the point is without the here calculated movement
                 * and without the xTranslate and yTranslate variables
                 */
                fixture: stem:children[-2]:skeleton:on;
                origin: scale * fixture;
                /* target is where the point would be without uniformScaling,
                 * using the standard scaling of the current setup
                 * 
                 * I don't use _translate here delibarately, so we can still
                 * use it in following rules, without having this rule
                 * compensating.
                 */
                target: _scale * fixture;
                pinTo: target-origin;
            }
        }
    }
}
@namespace(glyph#d) {
    @dictionary {
        point > * {
            bowl: glyph[S"#bowl"];
            stem: glyph[S"#stem"];
            topSerif: glyph[S"#topSerif"];
            bottomSerif: glyph[S"#bottomSerif"];
            stemWidth: 2 * stem:children[0]:right:onLength;
        }
    }
    @namespace(penstroke#bowl) {
        /* fix the bowl 0 and -1 to the stem, where 0 right touches it */
        @dictionary {
            point:i(0) > center,
            point:i(-1) > center {
                target: stem:children[0]:left:on:x;
                origin: penstroke:children[0]:center;
                rightOffset: (Polar origin:parent:right:onLength origin:parent:right:onDir):x;
                pinX: target - origin:_on:x - rightOffset;
                pinTo: Vector pinX 0;
            }
            point:i(1) > center,
            point:i(-2)>center {
                pinTo: Vector (penstroke:children[0]:center:pinX / 2) 0;
            }
        }
    
    }
    @namespace(penstroke#topSerif) {
        @dictionary {
            point:i(0)>center {
                origin: this:_on:x;
                target: stem:children[-1]:right:on:x;
                pinTo: Vector (target-origin) 0;
            }
            point:i(-1)>center {
                origin: this:_on:x;
                target: stem:children[-1]:left:on:x;
                pinTo: Vector (target-origin-serifLength) 0;
            }
        }
    }
    @namespace(penstroke#bottomSerif) {
        @dictionary{
            point:i(0)>center {
                origin: this:_on:x;
                target: stem:children[0]:right:on:x;
                pinTo: Vector (target-origin+serifLength) 0;
            }
            point:i(-1)>center {
                origin: this:_on:x;
                target: stem:children[0]:left:on:x;
                pinTo: Vector (target-origin) 0;
            }
        }
    }
}

@namespace("glyph#h, glyph#n") {
    @dictionary {
        point > * {
            arch: glyph[S"#arch"];
            stem: glyph[S"#stem"];
            topSerif: glyph[S"#topSerif"];
            bottomLeftSerif: glyph[S"#bottomLeftSerif"];
            bottomRightSerif: glyph[S"#bottomRightSerif"];
            stemWidth: 2 * stem:children[0]:right:onLength;
        }
    }
    @namespace("penstroke#topSerif, penstroke#bottomLeftSerif") {
        @dictionary {
            point > center {
                referenceStroke: stem;
            }
        }
    }
    @namespace("penstroke#bottomRightSerif") {
        @dictionary {
            point > center {
                referenceStroke: arch;
            }
        }
    }
    @namespace("penstroke#arch") {
        @dictionary {
            point:i(-1) > center {
                origin: penstroke:children[-1]:center:_on:x;
                target: stem:children[0]:right:on:x;
                pinTo: Vector (target - origin) 0;
            }
        }
    }
}
@namespace(glyph#e) {
    @dictionary {
        point > * {
            stroke: glyph[S"#stroke"];
            bar: glyph[S"#bar"];
        }
    }
    @namespace(penstroke#bar) {
        @dictionary,  {
            point > center {
                origin: penstroke:children[0]:center:_on;
                target: stroke:children[0]:center:on;
                pinTo: target - origin
                    - (Polar parent:left:onLength parent:left:onDir);
            }
        }
    }
    @namespace(penstroke#stroke) {
        @dictionary,  {
            point:i(-1) > center {
                origin: this:_on:x
                    + (Polar parent:right:onLength parent:right:onDir):x;
                target: penstroke:children[0]:right:on:x;
                pinTo: Vector (target - origin) 0;
            }
            point:i(-2) > center {
                pinTo: Vector (penstroke:children[-1]:center:pinTo:x/2) 0;
            }
        }
    }
}

@namespace(glyph#s) {
    @dictionary {
        point > * {
            sShape: glyph[S"#sShape"];
        }
    }
    @namespace("penstroke#sShape") {
        @dictionary {
            /* fix the custom scaled bowl to the sShape*/
            
            point.drop.top > center {
                dropFixation: sShape[S"point.drop.top.fixation"]:skeleton:on
            }
            point.drop.bottom > center {
                dropFixation: sShape[S"point.drop.bottom.fixation"]:skeleton:on
            }
            
            point.drop > center {
                /* this is where the point is without the here calculated movement
                 * and without the xTranslate and yTranslate variables
                 */
                origin: scale * dropFixation;
                /* target is where the point would be without uniformScaling,
                 * using the standard scaling of the current setup
                 * 
                 * I don't use _translate here delibarately, so we can still
                 * use it in following rules, without having this rule
                 * compensating.
                 */
                target: _scale * dropFixation;
                pinTo: target-origin;
            }
        }
    }
}

@namespace(glyph#i) {
    @dictionary {
        point > * {
            stem: glyph[S"#stem"];
            topSerif: glyph[S"#topSerif"];
            bottomSerif: glyph[S"#bottomSerif"];
            stemWidth: 2 * stem:children[0]:right:onLength;
        }
    }
    @namespace("penstroke#dot") {
        @dictionary{
            point > center {
                dotFixation: penstroke:children[1]:skeleton:on;
                /* this is where the point is without the here calculated movement
                 * and without the xTranslate and yTranslate variables
                 */
                origin: scale * dotFixation;
                /* target is where the point would be without uniformScaling,
                 * using the standard scaling of the current setup
                 * 
                 * I don't use _translate here delibarately, so we can still
                 * use it in following rules, without having this rule
                 * compensating.
                 */
                target: _scale * dotFixation;
                pinTo: target-origin;
            }
        }
    }
    @namespace("penstroke#topSerif, penstroke#bottomSerif") {
        @dictionary {
            point > center {
                referenceStroke: stem;
            }
        }
    }
}

@namespace(glyph#j) {
    @dictionary {
        point > * {
            stem: glyph[S"#stem"];
            topSerif: glyph[S"#topSerif"];
            stemWidth: 2 * stem[S"point.top"]:right:onLength;
        }
    }
    @namespace("penstroke#dot") {
        @dictionary{
            point > center {
                dotFixation: penstroke:children[1]:skeleton:on;
                /* this is where the point is without the here calculated movement
                 * and without the xTranslate and yTranslate variables
                 */
                origin: scale * dotFixation;
                /* target is where the point would be without uniformScaling,
                 * using the standard scaling of the current setup
                 * 
                 * I don't use _translate here delibarately, so we can still
                 * use it in following rules, without having this rule
                 * compensating.
                 */
                target: _scale * dotFixation;
                pinTo: target-origin;
            }
        }
    }
    @namespace("penstroke#stem") {
        @dictionary {
            /* fix the drop to the stem*/
            point > center {
                drop: penstroke[S"point.drop.fixation"];
                dropFixation: drop:skeleton:on;
            }
            point.drop > center {
                /* this is where the point is without the here calculated movement
                 * and without the xTranslate and yTranslate variables
                 */
                origin: scale * dropFixation;
                /* target is where the point would be without uniformScaling,
                 * using the standard scaling of the current setup
                 * 
                 * I don't use _translate here delibarately, so we can still
                 * use it in following rules, without having this rule
                 * compensating.
                 */
                target: _scale * dropFixation;
                pinTo: target-origin;
            }
        }
    }
    @namespace("penstroke#topSerif") {
        @dictionary {
            point > center {
                referenceStroke: stem;
            }
        }
    }
}


@namespace(glyph#b) {
    @dictionary {
        point > *,
        spot {
            stem: glyph[S"#stem"];
            bowl: glyph[S"#bowl"];
            topSerif: glyph[S"#topSerif"];
            stemWidth: 2 * stem[S".top"]:right:onLength;
        }
    }
    @namespace("penstroke#topSerif") {
        @dictionary {
            point > center {
                referenceStroke: stem;
            }
        }
    }
    @namespace("outline#terminal") {
        @dictionary {
            spot.top.left {
                target: stem[S".bottom"]:left:on
            }
            spot.top.right {
                target: stem[S".bottom"]:right:on
            }
            spot.upper.connection {
                target: bowl[S".connection"]:left:on
            }
            spot.lower.connection {
                target: bowl[S".connection"]:right:on
            }
            
            spot.bottom, spot.bridge {
                _on: skeleton:on;
            }
            spot.bottom.inner {
                _xRef: parent[S".bottom.outer"];
                _x: (_on:x - _xRef:_on:x) * weightFactor + _xRef:on:x;
            }
            spot.bridge {
                _xRef: stem[S".bottom"]:center:on;
                _yRef: _xRef;
            }
            
            
        }
        spot.top, spot.connection {
            on: target;
        }
        spot.bottom.outer {
            on: Vector parent[S".top.left"]:on:x _on:y;
        }
        spot.bottom.inner {
            on: Vector _x _on:y;
        }
        spot.bridge {
            on: Vector _x _y;
        }
    }
    @namespace(penstroke#bowl) {
        /* fix the bowl .to-stem to the stem, where .to-stem center touches it */
        @dictionary {
            point.to-stem > center {
                target: stem[S"point.top"]:right:on:x;
                origin: this;
                rightOffset: (Polar origin:parent:right:onLength origin:parent:right:onDir):x;
                pinX: target - origin:_on:x - rightOffset;
                pinTo: Vector pinX 0;
            }
            point.top.horizontal>center {
                pinTo: Vector (penstroke[S"point.to-stem"]:center:pinX / 2) 0;
            }
        }
    }
}
@namespace(glyph#c){
    @namespace("penstroke#cShape") {
        @dictionary {
            /* fix the drop to the cShape*/
            point > center {
                drop: penstroke[S"point.drop.top.fixation"];
                dropFixation: drop:skeleton:on;
                outstroke: penstroke[S"point.outstroke"];
            }
            point.drop > center {
                /* this is where the point is without the here calculated movement
                 * and without the xTranslate and yTranslate variables
                 */
                origin: scale * dropFixation;
                /* target is where the point would be without uniformScaling,
                 * using the standard scaling of the current setup
                 * 
                 * I don't use _translate here delibarately, so we can still
                 * use it in following rules, without having this rule
                 * compensating.
                 */
                target: _scale * dropFixation;
                pinTo: target-origin;
            }
            /**
             * this is almost copy pasted from the setup of glyph#e
             */
            point.outstroke > center {
                origin: this:_on:x
                    + (Polar parent:left:onLength parent:left:onDir):x;
                target: drop:left:on:x;
                pinTo: Vector (target - origin) 0;
            }
            point.horizontal.bottom > center {
                pinTo: Vector (outstroke:center:pinTo:x/2) 0;
            }
        }
    }
}
@namespace(glyph#f) {
    @dictionary {
        point > * {
            stem: glyph[S"#stem"];
            bottomSerif: glyph[S"#bottomSerif"];
            stemWidth: 2 * stem[S".bottom"]:right:onLength;
        }
    }
    @namespace("penstroke#stem") {
        @dictionary {
            /* fix the drop to the stem*/
            point > center {
                drop: penstroke[S"point.drop.top.fixation"];
                dropFixation: drop:skeleton:on;
            }
            point.drop > center {
                /* this is where the point is without the here calculated movement
                 * and without the xTranslate and yTranslate variables
                 */
                origin: scale * dropFixation;
                /* target is where the point would be without uniformScaling,
                 * using the standard scaling of the current setup
                 * 
                 * I don't use _translate here delibarately, so we can still
                 * use it in following rules, without having this rule
                 * compensating.
                 */
                target: _scale * dropFixation;
                pinTo: target-origin;
            }
        }
    }
    @namespace("penstroke#horizontalStroke") {
        @dictionary {
            point.left > center{
                target: bottomSerif[S"point.left > center"]:on;
                pinTo: Vector (target:x - _on:x) 0;
            }
        }
    }
    @namespace("penstroke#bottomSerif") {
        @dictionary {
            point > center {
                referenceStroke: stem;
            }
        }
    }
}

@namespace(glyph#g) {
    @dictionary {
        point > * {
            leftBowl: glyph[S"#leftBowl"];
            rightBowl: glyph[S"#rightBowl"];
            ear: glyph[S"#ear"];
            loop: glyph[S"loop"];
        }
    }
    @namespace("penstroke#ear") {
        @dictionary {
            /* fix the drop to the stem*/
            point > center {
                drop: penstroke[S"point.drop.top.fixation"];
                dropFixation: drop:skeleton:on;
            }
            point.drop > center {
                /* this is where the point is without the here calculated movement
                 * and without the xTranslate and yTranslate variables
                 */
                origin: scale * dropFixation;
                /* target is where the point would be without uniformScaling,
                 * using the standard scaling of the current setup
                 * 
                 * I don't use _translate here delibarately, so we can still
                 * use it in following rules, without having this rule
                 * compensating.
                 */
                target: _scale * dropFixation;
                pinTo: target-origin;
            }
        }
    }
}
