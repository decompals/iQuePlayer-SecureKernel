#include "libcrypto/poly_math.h"
#include "libcrypto/elliptic_math.h"
#include "macros.h"

// TODO NIST curves discussion
// https://cr.yp.to/talks/2013.05.31/slides-dan+tanja-20130531-4x3.pdf

point precomputed_signer = {
    { {
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
    } },
    { {
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
        0xFFFFFFFF,
    } },
};

point precomputed_pk[4] = {
    {
     { {
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
        } },
     { {
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
        } },
     },
    {
     { {
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
        } },
     { {
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
        } },
     },
    {
     { {
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
        } },
     { {
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
        } },
     },
    {
     { {
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
        } },
     { {
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
            0xFFFFFFFF,
        } },
     },
};

curve named_curve;
point named_point;
point precomputed_bp[16];

void Init_233_bit(void) {
    named_curve.form = 1;
    named_curve.a6.e[0] = 0x66;
    named_curve.a6.e[1] = 0x647EDE6C;
    named_curve.a6.e[2] = 0x332C7F8C;
    named_curve.a6.e[3] = 0x0923BB58;
    named_curve.a6.e[4] = 0x213B333B;
    named_curve.a6.e[5] = 0x20E9CE42;
    named_curve.a6.e[6] = 0x81FE115F;
    named_curve.a6.e[7] = 0x7D8F90AD;
    named_curve.a2.e[0] = 0;
    named_curve.a2.e[1] = 0;
    named_curve.a2.e[2] = 0;
    named_curve.a2.e[3] = 0;
    named_curve.a2.e[4] = 0;
    named_curve.a2.e[5] = 0;
    named_curve.a2.e[6] = 0;
    named_curve.a2.e[7] = 1;
    named_point.x.e[0] = 0xFA;
    named_point.x.e[1] = 0xC9DFCBAC;
    named_point.x.e[2] = 0x8313BB21;
    named_point.x.e[3] = 0x39F1BB75;
    named_point.x.e[4] = 0x5FEF65BC;
    named_point.x.e[5] = 0x391F8B36;
    named_point.x.e[6] = 0xF8F8EB73;
    named_point.x.e[7] = 0x71FD558B;
    named_point.y.e[0] = 0x100;
    named_point.y.e[1] = 0x6A08A419;
    named_point.y.e[2] = 0x03350678;
    named_point.y.e[3] = 0xE58528BE;
    named_point.y.e[4] = 0xBF8A0BEF;
    named_point.y.e[5] = 0xF867A7CA;
    named_point.y.e[6] = 0x36716F7E;
    named_point.y.e[7] = 0x01F81052;
    precomputed_bp[0].x.e[0] = 0;
    precomputed_bp[0].x.e[1] = 0;
    precomputed_bp[0].x.e[2] = 0;
    precomputed_bp[0].x.e[3] = 0;
    precomputed_bp[0].x.e[4] = 0;
    precomputed_bp[0].x.e[5] = 0;
    precomputed_bp[0].x.e[6] = 0;
    precomputed_bp[0].x.e[7] = 0;
    precomputed_bp[0].y.e[0] = 0;
    precomputed_bp[0].y.e[1] = 0;
    precomputed_bp[0].y.e[2] = 0;
    precomputed_bp[0].y.e[3] = 0;
    precomputed_bp[0].y.e[4] = 0;
    precomputed_bp[0].y.e[5] = 0;
    precomputed_bp[0].y.e[6] = 0;
    precomputed_bp[0].y.e[7] = 0;
    precomputed_bp[1].x.e[0] = 0xFA;
    precomputed_bp[1].x.e[1] = 0xC9DFCBAC;
    precomputed_bp[1].x.e[2] = 0x8313BB21;
    precomputed_bp[1].x.e[3] = 0x39F1BB75;
    precomputed_bp[1].x.e[4] = 0x5FEF65BC;
    precomputed_bp[1].x.e[5] = 0x391F8B36;
    precomputed_bp[1].x.e[6] = 0xF8F8EB73;
    precomputed_bp[1].x.e[7] = 0x71FD558B;
    precomputed_bp[1].y.e[0] = 0x100;
    precomputed_bp[1].y.e[1] = 0x6A08A419;
    precomputed_bp[1].y.e[2] = 0x03350678;
    precomputed_bp[1].y.e[3] = 0xE58528BE;
    precomputed_bp[1].y.e[4] = 0xBF8A0BEF;
    precomputed_bp[1].y.e[5] = 0xF867A7CA;
    precomputed_bp[1].y.e[6] = 0x36716F7E;
    precomputed_bp[1].y.e[7] = 0x01F81052;
    precomputed_bp[2].x.e[0] = 0x123;
    precomputed_bp[2].x.e[1] = 0xD731A036;
    precomputed_bp[2].x.e[2] = 0x6B9ED354;
    precomputed_bp[2].x.e[3] = 0x2323A649;
    precomputed_bp[2].x.e[4] = 0x7CF718AB;
    precomputed_bp[2].x.e[5] = 0x012FE27B;
    precomputed_bp[2].x.e[6] = 0x5CB0F320;
    precomputed_bp[2].x.e[7] = 0xF7B10AED;
    precomputed_bp[2].y.e[0] = 0x163;
    precomputed_bp[2].y.e[1] = 0x6760CE8F;
    precomputed_bp[2].y.e[2] = 0x4EAAE9BA;
    precomputed_bp[2].y.e[3] = 0xF12A1514;
    precomputed_bp[2].y.e[4] = 0x67A7B3F4;
    precomputed_bp[2].y.e[5] = 0xB92A0E61;
    precomputed_bp[2].y.e[6] = 0xFA190593;
    precomputed_bp[2].y.e[7] = 0x100A80;
    precomputed_bp[3].x.e[0] = 0x1C6;
    precomputed_bp[3].x.e[1] = 0x40B411FE;
    precomputed_bp[3].x.e[2] = 0xA77C6CDC;
    precomputed_bp[3].x.e[3] = 0x4A587FC3;
    precomputed_bp[3].x.e[4] = 0x46A40358;
    precomputed_bp[3].x.e[5] = 0x7856EDB0;
    precomputed_bp[3].x.e[6] = 0x193EA71F;
    precomputed_bp[3].x.e[7] = 0xA7524B93;
    precomputed_bp[3].y.e[0] = 0x104;
    precomputed_bp[3].y.e[1] = 0xA659102F;
    precomputed_bp[3].y.e[2] = 0x034B0BB8;
    precomputed_bp[3].y.e[3] = 0xAFB5AFA6;
    precomputed_bp[3].y.e[4] = 0x1B8ADF8C;
    precomputed_bp[3].y.e[5] = 0xB6CCA538;
    precomputed_bp[3].y.e[6] = 0x631BF941;
    precomputed_bp[3].y.e[7] = 0x3C5D1BFA;
    precomputed_bp[4].x.e[0] = 0x84;
    precomputed_bp[4].x.e[1] = 0xC44003BB;
    precomputed_bp[4].x.e[2] = 0x3DA842D2;
    precomputed_bp[4].x.e[3] = 0x7022EF1C;
    precomputed_bp[4].x.e[4] = 0x3264A00E;
    precomputed_bp[4].x.e[5] = 0x70ED2F1A;
    precomputed_bp[4].x.e[6] = 0x42027637;
    precomputed_bp[4].x.e[7] = 0xE48A3A6D;
    precomputed_bp[4].y.e[0] = 0x7B;
    precomputed_bp[4].y.e[1] = 0x91E07DD6;
    precomputed_bp[4].y.e[2] = 0x9EF7F6A2;
    precomputed_bp[4].y.e[3] = 0xE1F72622;
    precomputed_bp[4].y.e[4] = 0x135F0D1D;
    precomputed_bp[4].y.e[5] = 0xBBCC886E;
    precomputed_bp[4].y.e[6] = 0x85CCD0F7;
    precomputed_bp[4].y.e[7] = 0xDA1F6D98;
    precomputed_bp[5].x.e[0] = 0x96;
    precomputed_bp[5].x.e[1] = 0x15D88A99;
    precomputed_bp[5].x.e[2] = 0xCEB0B782;
    precomputed_bp[5].x.e[3] = 0xC4794801;
    precomputed_bp[5].x.e[4] = 0xE0378BFB;
    precomputed_bp[5].x.e[5] = 0x96B102BE;
    precomputed_bp[5].x.e[6] = 0x4D8BC62B;
    precomputed_bp[5].x.e[7] = 0xF640FD06;
    precomputed_bp[5].y.e[0] = 0x1D2;
    precomputed_bp[5].y.e[1] = 0xA79FA10B;
    precomputed_bp[5].y.e[2] = 0x9E8D0426;
    precomputed_bp[5].y.e[3] = 0xB22D2DB7;
    precomputed_bp[5].y.e[4] = 0x410004C8;
    precomputed_bp[5].y.e[5] = 0xC5EF7BCA;
    precomputed_bp[5].y.e[6] = 0x4BD020A2;
    precomputed_bp[5].y.e[7] = 0x7BC255C3;
    precomputed_bp[6].x.e[0] = 0xF8;
    precomputed_bp[6].x.e[1] = 0x9335641A;
    precomputed_bp[6].x.e[2] = 0x6D52D1B7;
    precomputed_bp[6].x.e[3] = 0x1FE5286A;
    precomputed_bp[6].x.e[4] = 0xB5D18EB1;
    precomputed_bp[6].x.e[5] = 0xB2A6BF0A;
    precomputed_bp[6].x.e[6] = 0x47E4A3FB;
    precomputed_bp[6].x.e[7] = 0x95B18299;
    precomputed_bp[6].y.e[0] = 0x114;
    precomputed_bp[6].y.e[1] = 0x011918FC;
    precomputed_bp[6].y.e[2] = 0xE2AFB564;
    precomputed_bp[6].y.e[3] = 0x384E6A3F;
    precomputed_bp[6].y.e[4] = 0x4FA20321;
    precomputed_bp[6].y.e[5] = 0xF7DCE7E2;
    precomputed_bp[6].y.e[6] = 0x316149DD;
    precomputed_bp[6].y.e[7] = 0x83816459;
    precomputed_bp[7].x.e[0] = 0xD;
    precomputed_bp[7].x.e[1] = 0xB61258CA;
    precomputed_bp[7].x.e[2] = 0x728A0565;
    precomputed_bp[7].x.e[3] = 0x128EA0F8;
    precomputed_bp[7].x.e[4] = 0x3A67E3E7;
    precomputed_bp[7].x.e[5] = 0xCB752032;
    precomputed_bp[7].x.e[6] = 0x1D1B0144;
    precomputed_bp[7].x.e[7] = 0x2E390E0F;
    precomputed_bp[7].y.e[0] = 0x8A;
    precomputed_bp[7].y.e[1] = 0x90174EC0;
    precomputed_bp[7].y.e[2] = 0x8BCAEF7C;
    precomputed_bp[7].y.e[3] = 0xAFEDB681;
    precomputed_bp[7].y.e[4] = 0x3817F429;
    precomputed_bp[7].y.e[5] = 0x9167BB6D;
    precomputed_bp[7].y.e[6] = 0x5345180F;
    precomputed_bp[7].y.e[7] = 0x9F17791D;
    precomputed_bp[8].x.e[0] = 0x41;
    precomputed_bp[8].x.e[1] = 0xA7AB0B40;
    precomputed_bp[8].x.e[2] = 0x47234421;
    precomputed_bp[8].x.e[3] = 0x54A87FC5;
    precomputed_bp[8].x.e[4] = 0x8278556D;
    precomputed_bp[8].x.e[5] = 0x83618E53;
    precomputed_bp[8].x.e[6] = 0x1F9C4C7C;
    precomputed_bp[8].x.e[7] = 0x3816C879;
    precomputed_bp[8].y.e[0] = 0xBA;
    precomputed_bp[8].y.e[1] = 0x7A211A5D;
    precomputed_bp[8].y.e[2] = 0xBC8DE196;
    precomputed_bp[8].y.e[3] = 0x48A65332;
    precomputed_bp[8].y.e[4] = 0x907318E2;
    precomputed_bp[8].y.e[5] = 0xD9205A76;
    precomputed_bp[8].y.e[6] = 0xC64A2DA1;
    precomputed_bp[8].y.e[7] = 0x9F6972F2;
    precomputed_bp[9].x.e[0] = 0x122;
    precomputed_bp[9].x.e[1] = 0x9A00CA04;
    precomputed_bp[9].x.e[2] = 0x6DC401BE;
    precomputed_bp[9].x.e[3] = 0x2335BB37;
    precomputed_bp[9].x.e[4] = 0x59C7C243;
    precomputed_bp[9].x.e[5] = 0xF884DEA8;
    precomputed_bp[9].x.e[6] = 0xD835DFED;
    precomputed_bp[9].x.e[7] = 0xEABD47;
    precomputed_bp[9].y.e[0] = 0x82;
    precomputed_bp[9].y.e[1] = 0xFBE8C10B;
    precomputed_bp[9].y.e[2] = 0x7532AC2B;
    precomputed_bp[9].y.e[3] = 0x6BE6DB88;
    precomputed_bp[9].y.e[4] = 0xEBCC7739;
    precomputed_bp[9].y.e[5] = 0x2B267E5E;
    precomputed_bp[9].y.e[6] = 0xA23A88EA;
    precomputed_bp[9].y.e[7] = 0x69DA2F73;
    precomputed_bp[10].x.e[0] = 0x100;
    precomputed_bp[10].x.e[1] = 0x85E45B07;
    precomputed_bp[10].x.e[2] = 0xE6EF1D6E;
    precomputed_bp[10].x.e[3] = 0x87D6D582;
    precomputed_bp[10].x.e[4] = 0x623DB5D0;
    precomputed_bp[10].x.e[5] = 0x65182781;
    precomputed_bp[10].x.e[6] = 0xE5C3F825;
    precomputed_bp[10].x.e[7] = 0x138AD7E8;
    precomputed_bp[10].y.e[0] = 0x19F;
    precomputed_bp[10].y.e[1] = 0xF9609CD0;
    precomputed_bp[10].y.e[2] = 0x4C8FA4C5;
    precomputed_bp[10].y.e[3] = 0x9862E9CB;
    precomputed_bp[10].y.e[4] = 0x864F72D4;
    precomputed_bp[10].y.e[5] = 0x362665DD;
    precomputed_bp[10].y.e[6] = 0xC30643DB;
    precomputed_bp[10].y.e[7] = 0x59E4B08A;
    precomputed_bp[11].x.e[0] = 0x17F;
    precomputed_bp[11].x.e[1] = 0xCD50381E;
    precomputed_bp[11].x.e[2] = 0xA66DF765;
    precomputed_bp[11].x.e[3] = 0x5CF43CF7;
    precomputed_bp[11].x.e[4] = 0x3D0788A6;
    precomputed_bp[11].x.e[5] = 0x8938B3E5;
    precomputed_bp[11].x.e[6] = 0x5012DF2B;
    precomputed_bp[11].x.e[7] = 0x8C1589E5;
    precomputed_bp[11].y.e[0] = 0x17;
    precomputed_bp[11].y.e[1] = 0xF5719186;
    precomputed_bp[11].y.e[2] = 0xD0EEFC0C;
    precomputed_bp[11].y.e[3] = 0x4AAC1FD7;
    precomputed_bp[11].y.e[4] = 0x95CE8EDA;
    precomputed_bp[11].y.e[5] = 0x81D8B45A;
    precomputed_bp[11].y.e[6] = 0x3B132EE2;
    precomputed_bp[11].y.e[7] = 0x770851D2;
    precomputed_bp[12].x.e[0] = 0xC1;
    precomputed_bp[12].x.e[1] = 0x4B5349C9;
    precomputed_bp[12].x.e[2] = 0x4C748262;
    precomputed_bp[12].x.e[3] = 0xE39E7051;
    precomputed_bp[12].x.e[4] = 0x71E5A2E8;
    precomputed_bp[12].x.e[5] = 0xAF258BC9;
    precomputed_bp[12].x.e[6] = 0x7EFA83EB;
    precomputed_bp[12].x.e[7] = 0x8ED8777E;
    precomputed_bp[12].y.e[0] = 0x19E;
    precomputed_bp[12].y.e[1] = 0x923CAF64;
    precomputed_bp[12].y.e[2] = 0x5601AF9B;
    precomputed_bp[12].y.e[3] = 0x0F5D1C6C;
    precomputed_bp[12].y.e[4] = 0x48DE1EE6;
    precomputed_bp[12].y.e[5] = 0xF438E699;
    precomputed_bp[12].y.e[6] = 0x0E0A7651;
    precomputed_bp[12].y.e[7] = 0xF834CFD1;
    precomputed_bp[13].x.e[0] = 0x156;
    precomputed_bp[13].x.e[1] = 0x0A419BC4;
    precomputed_bp[13].x.e[2] = 0x84828AE2;
    precomputed_bp[13].x.e[3] = 0xD0114081;
    precomputed_bp[13].x.e[4] = 0x697D40;
    precomputed_bp[13].x.e[5] = 0xC2BB840A;
    precomputed_bp[13].x.e[6] = 0xB626775F;
    precomputed_bp[13].x.e[7] = 0x40955DDE;
    precomputed_bp[13].y.e[0] = 0x1E0;
    precomputed_bp[13].y.e[1] = 0xAFCB6B6A;
    precomputed_bp[13].y.e[2] = 0x2EFB3AE6;
    precomputed_bp[13].y.e[3] = 0x68EC3FAC;
    precomputed_bp[13].y.e[4] = 0x4D9524B9;
    precomputed_bp[13].y.e[5] = 0x8503E4FE;
    precomputed_bp[13].y.e[6] = 0x3D0C3039;
    precomputed_bp[13].y.e[7] = 0xBF9410AC;
    precomputed_bp[14].x.e[0] = 0x149;
    precomputed_bp[14].x.e[1] = 0x9459C5B9;
    precomputed_bp[14].x.e[2] = 0x935F6C3B;
    precomputed_bp[14].x.e[3] = 0x223FE1C0;
    precomputed_bp[14].x.e[4] = 0x76CCB5E9;
    precomputed_bp[14].x.e[5] = 0x9D810FBB;
    precomputed_bp[14].x.e[6] = 0x8D051E14;
    precomputed_bp[14].x.e[7] = 0x3FC6AD47;
    precomputed_bp[14].y.e[0] = 0x119;
    precomputed_bp[14].y.e[1] = 0x7D175B61;
    precomputed_bp[14].y.e[2] = 0x4DA9494C;
    precomputed_bp[14].y.e[3] = 0x3FE040B9;
    precomputed_bp[14].y.e[4] = 0x43017773;
    precomputed_bp[14].y.e[5] = 0xD2061EA2;
    precomputed_bp[14].y.e[6] = 0xE9C9356C;
    precomputed_bp[14].y.e[7] = 0xFF0F3D83;
    precomputed_bp[15].x.e[0] = 0x10B;
    precomputed_bp[15].x.e[1] = 0x47A49B1F;
    precomputed_bp[15].x.e[2] = 0xF7C75C45;
    precomputed_bp[15].x.e[3] = 0xA9D578F2;
    precomputed_bp[15].x.e[4] = 0xB07CC152;
    precomputed_bp[15].x.e[5] = 0x80B18075;
    precomputed_bp[15].x.e[6] = 0x9AE882B1;
    precomputed_bp[15].x.e[7] = 0x8BC66C86;
    precomputed_bp[15].y.e[0] = 0x1B4;
    precomputed_bp[15].y.e[1] = 0xD626657D;
    precomputed_bp[15].y.e[2] = 0x510FDCF0;
    precomputed_bp[15].y.e[3] = 0xC0CFF138;
    precomputed_bp[15].y.e[4] = 0x75653E50;
    precomputed_bp[15].y.e[5] = 0xD1465CC5;
    precomputed_bp[15].y.e[6] = 0x49571CDA;
    precomputed_bp[15].y.e[7] = 0x0EC46B60;
}

void copy_point(const point* p1, point* p2) {
    copy(&p1->x, &p2->x);
    copy(&p1->y, &p2->y);
}

/**
 * Computes elliptic curve point addition p3 = p1 + p2 on curv
 */
void poly_elliptic_sum(const point* p1, const point* p2, point* p3, const curve* curv) {
    ITER_TYPE i;
    field_2n x1;
    field_2n y1;
    field_2n lambda;
    field_2n onex;
    field_2n lambda2;
    element check;

    // If p1 is 0, p3 = p2
    check = 0;
    for (i = 0; i < 8u; i++) {
        check |= p1->x.e[i] | p1->y.e[i];
    }
    if (check == 0) {
        copy_point(p2, p3);
        return;
    }

    // If p2 is 0, p3 = p1
    check = 0;
    for (i = 0; i < 8u; i++) {
        check |= p2->x.e[i] | p2->y.e[i];
    }
    if (check == 0) {
        copy_point(p1, p3);
        return;
    }

    //! This doesn't catch p1 = -p2

    // If p1 = p2
    check = 0;
    for (i = 0; i < 8u; i++) {
        if ((p1->x.e[i] != p2->x.e[i]) || (p1->y.e[i] != p2->y.e[i])) {
            check = 1;
        }
    }
    if (check != 1) {
        //! Timing attack
        poly_elliptic_double(p1, p3, curv);
        return;
    }

    null(&x1);
    null(&y1);

    // (x1, y1) = p1 + p2
    check = 0;
    for (i = 0; i < 8u; i++) {
        x1.e[i] = p1->x.e[i] ^ p2->x.e[i];
        y1.e[i] = p1->y.e[i] ^ p2->y.e[i];
        check |= x1.e[i];
    }
    if (check == 0) {
        // If x1 == 0, p1 and p2 were inverse points on the curve so the result is the point at infinity
        null(&p3->x);
        null(&p3->y);
        return;
    }

    // onex = x1^{-1}
    poly_inv(&x1, &onex);
    // lambda = x1^{-1} y1
    poly_mul(&onex, &y1, &lambda);
    // lambda2 = lambda^2
    poly_mul(&lambda, &lambda, &lambda2);

    if (curv->form == 0) {
        return;
    }

    // p3.x = lambda2 + lambda + x1 + a2
    for (i = 0; i < 8u; i++) {
        p3->x.e[i] = lambda.e[i] ^ lambda2.e[i] ^ x1.e[i] ^ curv->a2.e[i];
    }

    // x1 = p1.x + p3.x
    for (i = 0; i < 8u; i++) {
        x1.e[i] = p1->x.e[i] ^ p3->x.e[i];
    }

    poly_mul(&x1, &lambda, &lambda2);

    // p3.y = x1 * lambda + p3.x + p1.y
    for (i = 0; i < 8u; i++) {
        p3->y.e[i] = lambda2.e[i] ^ p3->x.e[i] ^ p1->y.e[i];
    }
}

/**
 * Special case of elliptic curve point addition, p3 = p1 + p1
 */
void poly_elliptic_double(const point* p1, point* p3, const curve* curv) {
    field_2n x1;
    field_2n y1;
    field_2n lambda;
    field_2n lambda2;
    field_2n t1;
    ITER_TYPE i;
    element check;

    // If p1 is 0, p3 is 0
    check = 0;
    for (i = 0; i < 8u; i++) {
        check |= p1->x.e[i];
    }
    if (check == 0) {
        null(&p3->x);
        null(&p3->y);
        return;
    }

    poly_inv(&p1->x, &x1);
    poly_mul(&x1, &p1->y, &y1);

    for (i = 0; i < 8u; i++) {
        lambda.e[i] = p1->x.e[i] ^ y1.e[i];
    }

    poly_mul(&lambda, &lambda, &lambda2);

    if (curv->form == 0) {
        return;
    }

    for (i = 0; i < 8u; i++) {
        p3->x.e[i] = lambda.e[i] ^ lambda2.e[i] ^ curv->a2.e[i];
    }

    lambda.e[7] ^= 1;

    poly_mul(&lambda, &p3->x, &t1);
    poly_mul(&p1->x, &p1->x, &x1);

    for (i = 0; i < 8u; i++) {
        p3->y.e[i] = x1.e[i] ^ t1.e[i];
    }
}

/* p3 = p1 - p2 in the sense of elliptic curve group operations */
void poly_elliptic_sub(const point* p1, const point* p2, point* p3, const curve* curv) {
    point temp;
    ITER_TYPE i;

    // temp = -p2 = (p2.x, p2.x + p2.y)
    copy(&p2->x, &temp.x);
    null(&temp.y);
    for (i = 0; i < 8u; i++) {
        temp.y.e[i] = p2->x.e[i] ^ p2->y.e[i];
    }
    // p3 = p1 + p2 = p1 - p2
    poly_elliptic_sum(p1, &temp, p3, curv);
}

/* Elliptic curve point multiplication, r = k x p, using a slow double-and-add method */
void poly_elliptic_mul_slow(const field_2n* k, const point* p, point* r, const curve* curv) {
    char balanced[234]; //! Cache timing attack?
    ITER_TYPE i;
    short int bit_count;
    element notzero;
    field_2n number;
    point temp;

    copy(k, &number);

    notzero = 0;
    for (i = 0; i < 8u; i++) {
        notzero |= number.e[i];
    }
    if (notzero == 0) {
        null(&r->x);
        null(&r->y);
        return;
    }

    bit_count = 0;
    do {
        if (number.e[7] & 1) {
            balanced[bit_count] = 2 - (number.e[7] & 3);
            if (balanced[bit_count] < 0) {
                for (i = 7; GEQ0(i); i--) {
                    number.e[i]++;
                    if (number.e[i] != 0) {
                        break;
                    }
                }
            }
        } else {
            balanced[bit_count] = 0;
        }
        number.e[7] &= ~1;
        poly_rot_right(&number);
        bit_count++;

        notzero = 0;
        for (i = 0; i < 8u; i++) {
            notzero |= number.e[i];
        }
    } while (notzero != 0);

    bit_count--;
    copy_point(p, r);

    while (bit_count > 0) {
        poly_elliptic_double(r, &temp, curv);
        bit_count--;
        switch (balanced[bit_count]) {
            case 1:
                poly_elliptic_sum(p, &temp, r, curv);
                break;

            case -1:
                poly_elliptic_sub(&temp, p, r, curv);
                break;

            case 0:
                copy_point(&temp, r);
                break;
        }
    }
}

/* Compute r = k x p where x represents elliptic curve point multiplication on curv */
void poly_elliptic_mul_four(const field_2n* k, UNUSED const point* p, point* r, const curve* curv) {
    element columns[64];
    UNSIGNED int i;
    int j;
    element mask;
    point temppoint;
    field_2n number;
    element notzero;
    int bit_num;

    copy(k, &number);

    // If k = 0, r = 0
    notzero = 0;
    for (i = 0; i < 8u; i++) {
        notzero |= number.e[i];
    }
    if (notzero == 0) {
        null(&r->x);
        null(&r->y);
        return;
    }

    // Initialize columns as a function of k

    mask = 0x80000000;
    for (i = 0; i < 32; i++) {
        columns[i] = 0;
        bit_num = 3;
        for (j = 0; j < 8; j += 2) {
            columns[i] |= (k->e[j] & mask) >> (31 - i) << bit_num;
            bit_num--;
        }
        mask >>= 1;
    }

    mask = 0x80000000;
    for (i = 32; i < 64; i++) {
        columns[i] = 0;
        bit_num = 3;
        for (j = 1; j < 8; j += 2) {
            columns[i] |= (k->e[j] & mask) >> (63 - i) << bit_num;
            bit_num--;
        }
        mask >>= 1;
    }

    null(&r->x);
    null(&r->y);

    // Use the Windowed Double-and-Add method to compute the point multiplication, using
    // precomputed values of d x p for d in [0,15]
    for (i = 0; i < 64; i++) {
        // temppoint = 2r
        poly_elliptic_double(r, &temppoint, curv);
        // r = temppoint + precomputed_bp[columns[i]]
        poly_elliptic_sum(&temppoint, &precomputed_bp[columns[i]], r, curv);
    }
}

void do_precompute_two(const point* p, point* precompute, const curve* curv) {
    int i;
    field_2n temp;

    for (i = 0; i < 4; i++) {
        null(&temp);
        temp.e[3] = (i & 2) >> 1; // [0, 0, 1, 1]
        temp.e[7] = i & 1;        // [0, 1, 0, 1]

        // i = 0 : temp = 0
        // i = 1 : temp = 2^224
        // i = 2 : temp = 2^96
        // i = 3 : temp = 2^224 + 2^96

        // precompute[i] = temp * p
        poly_elliptic_mul_slow(&temp, p, &precompute[i], curv);
    }
}

// r = k x p
void poly_elliptic_mul(const field_2n* k, const point* p, point* r, const curve* curv) {
    point precompute[4];
    element columns[128];
    UNSIGNED int i;
    int j;
    int diff;
    UNSIGNED int wordpos;
    element mask;
    point temppoint;
    field_2n number;
    element notzero;
    int bit_num;

    copy(k, &number);

    notzero = 0;
    for (i = 0; i < 8u; i++) {
        notzero |= number.e[i];
    }
    if (notzero == 0) {
        null(&r->x);
        null(&r->y);
        return;
    }

    diff = 0;
    for (i = 0; i < 8u; i++) {
        if (p->x.e[i] != precomputed_signer.x.e[i]) {
            diff = 1;
            break;
        }
        if (p->y.e[i] != precomputed_signer.y.e[i]) {
            diff = 1;
            break;
        }
    }

    if (diff == 1) {
        // Don't use the precomputed points, recalculate them
        do_precompute_two(p, precompute, curv);
        copy_point(p, &precomputed_signer);
        for (i = 0; i < 4; i++) {
            copy_point(&precompute[i], &precomputed_pk[i]);
        }
    } else {
        // Use the precomputed points
        for (i = 0; i < 4; i++) {
            copy_point(&precomputed_pk[i], &precompute[i]);
        }
    }

    for (wordpos = 0; wordpos < 4; wordpos++) {
        mask = 0x80000000;

        for (i = wordpos * 32; i < (wordpos + 1) * 32; i++) {
            columns[i] = 0;
            bit_num = 1;
            for (j = wordpos; j < 8; j += 4) {
                columns[i] |= ((u32)(k->e[j] & mask) >> (0x1F - (i - wordpos * 32))) << bit_num;
                bit_num--;
            }
            mask >>= 1;
        }
    }

    null(&r->x);
    null(&r->y);

    for (i = 0; i < 128; i++) {
        poly_elliptic_double(r, &temppoint, curv);
        poly_elliptic_sum(&temppoint, &precompute[columns[i]], r, curv);
    }
}
