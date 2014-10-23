/* boilerplate single inheritance */
@dictionary {
    point > * {
        indexGlyph: parent:parent:parent:index;
        indexPenstroke: parent:parent:index;
        indexPoint: parent:index;
        base: baseMaster
                    :children[indexGlyph]
                    :children[indexPenstroke]
                    :children[indexPoint]
                    :children[index]
                    ;
    }
}

point > * {
    onDir: base:onDir;
    
    onLength: base:onLength;
    inLength: base:inLength;
    outLength: base:outLength;
    
    inTension: base:inTension;
    outTension: base:outTension;
    
    inDirIntrinsic: base:inDirIntrinsic;
    outDirIntrinsic: base:outDirIntrinsic;
}

point > center {
    on: base:on;
    in: base:in;
    out: base:out;
}

/* terminals overide of skeleton2outline */
point:i(0) > left,
point:i(0) > right {
    inDir: base:inDir;
}

point:i(-1) > right,
point:i(-1) > left {
    outDir: base:outDir;
}
/* end boilerplate single inheritance */

/* change the weight */
@dictionary {
    point > *{
        /* Todo, make an weightFactor that can be used
         * by masters based on this master
         */
        length: onLength*weightFactor;
    }
}

point > left,
point > right {
    on: Polar length onDir + parent:center:on;
}

/* scale the skeleton */
@dictionary {
    point>center {
        transform: (Scaling widthFactor 1);
    }
}

point > center {
    on: transform * base:on;
    in: transform * base:in;
    out: transform * base:out;
}

/* define  higher level parameters*/
@dictionary{*{
    baseMaster: S"master#base";
    weightFactor: 1.6;
    widthFactor: 1.8;
}}
