@import 'lib/centreline-skeleton-to-symmetric-outline.cps';

/* Boilerplate of a two master metapolation
 * Before this you may want to read single-inheritance.cps
 * because it basically does the same, but less complex.
 */
@dictionary {
    point > * {
        indexGlyph: parent:parent:parent:index;
        indexPenstroke: parent:parent:index;
        indexPoint: parent:index;
        base1: baseMaster1
                    :children[indexGlyph]
                    :children[indexPenstroke]
                    :children[indexPoint]
                    :children[index]
                    ;
        base2: baseMaster2
                    :children[indexGlyph]
                    :children[indexPenstroke]
                    :children[indexPoint]
                    :children[index]
                    ;
        base3: baseMaster3
                    :children[indexGlyph]
                    :children[indexPenstroke]
                    :children[indexPoint]
                    :children[index]
                    ;
        base4: baseMaster4
                    :children[indexGlyph]
                    :children[indexPenstroke]
                    :children[indexPoint]
                    :children[index]
                    ;
        /* Ensure that the used proportions sum up to
         * 1; any other value produces usually unwanted effects.
         * You don't want this? in your master redefine it as 
         * interpolationUnit: 1;
         */
        interpolationUnit: 1/(proportion1 + proportion2 + proportion3 + proportion4);
        _p1: proportion1*interpolationUnit;
        _p2: proportion2*interpolationUnit;
        _p3: proportion3*interpolationUnit;
        _p4: proportion4*interpolationUnit;
    }
}

point > * {
    onDir: base1:onDir * _p1 + base2:onDir * _p2 + base3:onDir * _p3 + base4:onDir * _p4; 
    
    inLength: base1:inLength * _p1 + base2:inLength * _p2 + base3:inLength * _p3 + base4:inLength * _p4;
    outLength: base1:outLength * _p1 + base2:outLength * _p2 + base3:outLength * _p3 + base4:outLength * _p4;
    
    inTension: base1:inTension * _p1 + base2:inTension * _p2 + base3:inTension * _p3 + base4:inTension * _p4;
    outTension: base1:outTension * _p1 + base2:outTension * _p2 + base3:outTension * _p3 + base4:outTension * _p4;
    
    inDirIntrinsic: base1:inDirIntrinsic * _p1 + base2:inDirIntrinsic * _p2 + base3:inDirIntrinsic * _p3 + base4:inDirIntrinsic * _p4;
    outDirIntrinsic: base1:outDirIntrinsic * _p1 + base2:outDirIntrinsic * _p2 + base3:outDirIntrinsic * _p3 + base4:outDirIntrinsic * _p4;
}

point > left, point > right {
    onLength: base1:onLength * _p1 + base2:onLength * _p2 + base3:onLength * _p3 + base4:onLength * _p4;
}

point > center {
    on: base1:on * _p1 + base2:on * _p2 + base3:on * _p3 + base4:on * _p4;
    in: base1:in * _p1 + base2:in * _p2 + base3:in * _p3 + base4:in * _p4;
    out: base1:out * _p1 + base2:out * _p2 + base3:out * _p3 + base4:out * _p4;
}

/* terminals overide of skeleton2outline */
point:i(0) > left,
point:i(0) > right {
    inDir: base1:inDir * _p1 + base2:inDir * _p2 + base3:inDir * _p3 + base4:inDir * _p4;
}

point:i(-1) > right,
point:i(-1) > left {
    outDir: base1:outDir * _p1 + base2:outDir * _p2 + base3:outDir * _p3 + base4:outDir * _p4;
}
/* end boilerplate two master metapolation */

/* set up this masters super masters */
@dictionary {
    * {
        baseMaster1: S"master#anyOther";
        baseMaster2: S"master#any";
        baseMaster3: S"master#any";
        baseMaster4: S"master#any";
        proportion1: .25;
        proportion2: .25;
        proportion3: .25;
        proportion4: .25;
    }
}
