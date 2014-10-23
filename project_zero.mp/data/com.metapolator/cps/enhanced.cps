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
    on: transform * parent:skeleton:on;
    in: transform * parent:skeleton:in;
    out: transform * parent:skeleton:out;
}

/* define  higher level parameters*/
@dictionary{*{
    baseMaster: S"master#base";
    weightFactor: .7;
    widthFactor: .8;
}}
