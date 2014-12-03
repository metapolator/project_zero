@import 'wired-up.cps';
@import 'global.cps';

/* set up this masters parameters */
@dictionary {
    point > center {
        widthFactor: 1.3;
    }
    point > left, point > right {
        weightFactor: 0.2;
    }
}

@namespace("
  glyph#dvI penstroke#bubble point
, glyph#dvDA penstroke#bubble point
, glyph#dvA penstroke#lowerBow point:i(0)
, glyph#dvA penstroke#lowerBow point:i(1)
") {
    @dictionary {
        * {
            uniformScale: .5;
        }
    }
}
@namespace("
  glyph#a penstroke#stem point:i(-1)
, glyph#a penstroke#stem point:i(-2)
, point.drop
") {
    @dictionary {
        * {
            uniformScale: .35;
        }
    }
}

@namespace("
    glyph#s point.drop
") {
    @dictionary {
        * {
            uniformScale: .6;
        }
    }
}

@namespace("
    glyph#i penstroke#dot point
") {
    @dictionary {
        * {
            uniformScale: .45;
        }
    }
}

@namespace("
  glyph#d
, glyph#h
, glyph#n
, glyph#i
") {
    @dictionary {
        point > * {
            serifLength: stemWidth * 3;
        }
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
                center {
                    yTranslate: 72.5;
                    xTranslate: 65;
                }
            }
        }
        @dictionary {
            point:i(2) > center {
                xTranslate: 26;
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
                xTranslate: -84.5;
            }
        }
    }
}

@namespace("glyph#dvI") {
    @namespace(penstroke#sShape) {
        @dictionary {
            point:i(2) center {
                xTranslate: 19.5;
                yTranslate: 0;
            }
            point:i(-3) center {
                xTranslate: 19.5;
                yTranslate: 0;
            }
            
            point:i(-2) center {
                xTranslate: 44.2;
                yTranslate: 0;
            }
            
            point:i(-1) center {
                xTranslate: -26;
                yTranslate: 20;
            }
        }
        point:i(2) right{
            outTension: 1;
        }
        point:i(-1) center {
            in: on + Polar 15 deg 342;
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
                xTranslate: -91;
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
@namespace("glyph#dvDA") {
    @namespace(penstroke#bow) {
        @dictionary{
            point:i(-1) > center {
                xTranslate: 60;
                yTranslate: 30;
            }
        }
        point:i(-2) > left, point:i(-2) > right {
            outTension: 1;
            outDirIntrinsic: 0;
            outDir: 0;
        }
        point:i(-2) > center{
            out: on + Polar 30 deg 0;
        }
        point:i(-1) > center {
            in: on + Polar 30 deg 210;
        }
    }
    @namespace(penstroke#verticalConnection) {
        @dictionary {
            point:i(0) left {
                offset: Vector 0 5;
            }
        }
        point:i(0) left {
            in: on + Polar 25 deg -10;
        }
    }
}
@namespace(glyph#dvDHA) {
    @namespace(penstroke#lowerBow) {
        @dictionary {
            point:i(0) > center {
                yTranslate: 25;
            }
        }
    }
    @namespace(penstroke#bowConnection) {
        @dictionary {
            point:i(-1) > center {
                xTranslate: 84.5;
            }
        }
    }
}
@namespace(glyph#dvSSA) {
    @namespace(penstroke#bow) {
        @dictionary{
            point:i(0) right, point:i(0) left {
                weightSummand: 3;
            }
            point:i(0) center {
                yTranslate: 10;
            }
        }
        point:i(0) right {
            outTension: 1.5;
        }
        point:i(1) left {
            inTension: .85;
        }
        point:i(1) right {
            outTension: .65;
        }
    }
}
@namespace("glyph#a") {
    @namespace("penstroke#stem") {
        @dictionary{
            point:i(0) > center{
                xTranslate: -90;
                yTranslate: 5;
            }
            point:i(1) > center{
                xTranslate: -50;
            }
            
            point:i(0) > left,
            point:i(0) > right{
                weightSummand: 1;
            }
        }
        
        point:i(0) > right{
            outDirIntrinsic: parent:left:outDirIntrinsic;
        }
        
        point:i(0) > left{
            outDirIntrinsic: deg 15;
            outTension: .8;
        }
        point:i(1) > left{
            inTension: .9;
        }
        point:i(1) > right {
            inTension: 1;
        }
    
        point:i(-4)>right {
            outTension: .70;
        }
        point:i(-3)>left {
            outTension: 1;
            inTension: 1;
        }
        point:i(-3)>right {
            outTension: 1;
            inTension: 1;
        }
        point:i(-2)>right {
            inTension: 1.2;
        }
    }
    @namespace("penstroke#bowl") {
        @dictionary{
            point:i(0) > center {
                yTranslate: 30;
            }
            
            point:i(0) > left,
            point:i(0) > right{
                weightSummand: 1
            }
        }
        point:i(0) > left,
        point:i(0) > right {
            outTension: 1;
        }
        point:i(-2) > left,
        point:i(-2) > right {
            outTension: 1.2;
        }
        point:i(-1) > left,
        point:i(-1) > right {
            inTension: 1;
        }
        
    }
}
@namespace(glyph#d) {
    @namespace("penstroke#bowl") {
        @dictionary{
            point:i(0) > center {
                yTranslate: 30;
            }
            point:i(1) > center {
                xTranslate: -30;
            }
        }
    }
    point:i(0) > left {
        outTension: .7;
    }
    point:i(0) > right {
        outTension: .6;
    }
    point:i(1) > left {
        inTension: 1;
    }
    point:i(1) > right {
        inTension: 1.5;
    }
}
@namespace(glyph#h, glyph#n) {
    @namespace("penstroke#arch") {
        point:i(-1) > right,  point:i(-1) > left {
            inTension: 1.6;
            inDirIntrinsic: deg -27;
        }
        point:i(-2) > right, point:i(-2) > left {
            outTension: 1;
        }
    }
}
@namespace(glyph#e) {
    @namespace("penstroke#stroke") {
        point:i(1) > left {
            inTension: 1;
            outTension: 1;
        }
        point:i(2) > left {
            inTension: 1
        }
    }
}
@namespace(glyph#s) {
    @namespace(penstroke#sShape) {
        @dictionary {
            point.drop.bottom > center {
                xTranslate: 10;
                yTranslate: -8;
            }
            
            point.drop.top > center {
                yTranslate: -5;
            }
        }
        point.drop.bottom.fixation > right{
            outTension: 1.6;
        }
        point.horixontal.bottom > right{
            inTension: 1;
        }
        point.vertical.bottom > right{
            outTension: 1;
        }
        point.vertical.top > right{
            inTension: 1;
        }
        point.drop.top.fixation > left{
            inTension: 1.6;
        }
    }
}
