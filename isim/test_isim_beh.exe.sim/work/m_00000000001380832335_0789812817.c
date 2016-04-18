/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x16fbe694 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "S:/verilog/game/top.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};
static int ng3[] = {3, 0};
static int ng4[] = {7, 0};
static int ng5[] = {4, 0};
static int ng6[] = {2, 0};
static int ng7[] = {11, 0};
static int ng8[] = {8, 0};
static int ng9[] = {15, 0};
static int ng10[] = {12, 0};



static void Always_130_0(char *t0)
{
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t16;

LAB0:    t1 = (t0 + 3008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 3576);
    *((int *)t2) = 1;
    t3 = (t0 + 3040);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(131, ng0);

LAB5:    xsi_set_current_line(132, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_minus(t15, 32, t4, 2, t5, 32);
    t11 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t11, t15, 0, 0, 2, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(133, ng0);
    t11 = (t0 + 1928);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = ((char*)((ng1)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t13, 2, t14, 32);
    t16 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 2, 0LL);
    goto LAB8;

}

static void Always_138_1(char *t0)
{
    char t16[8];
    char t29[8];
    char t31[8];
    char t32[8];
    char t33[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t30;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    unsigned int t40;
    int t41;
    char *t42;
    unsigned int t43;
    int t44;
    int t45;
    char *t46;
    unsigned int t47;
    int t48;
    int t49;
    unsigned int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    int t54;
    int t55;

LAB0:    t1 = (t0 + 3256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(138, ng0);
    t2 = (t0 + 3592);
    *((int *)t2) = 1;
    t3 = (t0 + 3288);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(139, ng0);

LAB5:    xsi_set_current_line(140, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(148, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB27:    t5 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 32);
    if (t15 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t15 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t15 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t15 == 1)
        goto LAB34;

LAB35:
LAB36:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(141, ng0);
    t11 = (t0 + 1928);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);

LAB9:    t14 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t14, 32);
    if (t15 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 32);
    if (t15 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 32);
    if (t15 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 2, t2, 32);
    if (t15 == 1)
        goto LAB16;

LAB17:
LAB18:    goto LAB8;

LAB10:    xsi_set_current_line(142, ng0);
    t17 = (t0 + 2088);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t16, 0, 8);
    t20 = (t16 + 4);
    t21 = (t19 + 4);
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 0);
    *((unsigned int *)t16) = t23;
    t24 = *((unsigned int *)t21);
    t25 = (t24 >> 0);
    *((unsigned int *)t20) = t25;
    t26 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t26 & 15U);
    t27 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t27 & 15U);
    t28 = ((char*)((ng1)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_add(t29, 32, t16, 32, t28, 32);
    t30 = (t0 + 2088);
    t34 = (t0 + 2088);
    t35 = (t34 + 72U);
    t36 = *((char **)t35);
    t37 = ((char*)((ng3)));
    t38 = ((char*)((ng2)));
    xsi_vlog_convert_partindices(t31, t32, t33, ((int*)(t36)), 2, t37, 32, 1, t38, 32, 1);
    t39 = (t31 + 4);
    t40 = *((unsigned int *)t39);
    t41 = (!(t40));
    t42 = (t32 + 4);
    t43 = *((unsigned int *)t42);
    t44 = (!(t43));
    t45 = (t41 && t44);
    t46 = (t33 + 4);
    t47 = *((unsigned int *)t46);
    t48 = (!(t47));
    t49 = (t45 && t48);
    if (t49 == 1)
        goto LAB19;

LAB20:    goto LAB18;

LAB12:    xsi_set_current_line(143, ng0);
    t3 = (t0 + 2088);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t16, 0, 8);
    t11 = (t16 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 4);
    *((unsigned int *)t16) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 4);
    *((unsigned int *)t11) = t9;
    t10 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t10 & 15U);
    t22 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t22 & 15U);
    t14 = ((char*)((ng1)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_add(t29, 32, t16, 32, t14, 32);
    t17 = (t0 + 2088);
    t18 = (t0 + 2088);
    t19 = (t18 + 72U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng4)));
    t28 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t31, t32, t33, ((int*)(t20)), 2, t21, 32, 1, t28, 32, 1);
    t30 = (t31 + 4);
    t23 = *((unsigned int *)t30);
    t41 = (!(t23));
    t34 = (t32 + 4);
    t24 = *((unsigned int *)t34);
    t44 = (!(t24));
    t45 = (t41 && t44);
    t35 = (t33 + 4);
    t25 = *((unsigned int *)t35);
    t48 = (!(t25));
    t49 = (t45 && t48);
    if (t49 == 1)
        goto LAB21;

LAB22:    goto LAB18;

LAB14:    xsi_set_current_line(144, ng0);
    t3 = (t0 + 2088);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t16, 0, 8);
    t11 = (t16 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 8);
    *((unsigned int *)t16) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 8);
    *((unsigned int *)t11) = t9;
    t10 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t10 & 15U);
    t22 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t22 & 15U);
    t14 = ((char*)((ng1)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_add(t29, 32, t16, 32, t14, 32);
    t17 = (t0 + 2088);
    t18 = (t0 + 2088);
    t19 = (t18 + 72U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng7)));
    t28 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t31, t32, t33, ((int*)(t20)), 2, t21, 32, 1, t28, 32, 1);
    t30 = (t31 + 4);
    t23 = *((unsigned int *)t30);
    t41 = (!(t23));
    t34 = (t32 + 4);
    t24 = *((unsigned int *)t34);
    t44 = (!(t24));
    t45 = (t41 && t44);
    t35 = (t33 + 4);
    t25 = *((unsigned int *)t35);
    t48 = (!(t25));
    t49 = (t45 && t48);
    if (t49 == 1)
        goto LAB23;

LAB24:    goto LAB18;

LAB16:    xsi_set_current_line(145, ng0);
    t3 = (t0 + 2088);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t16, 0, 8);
    t11 = (t16 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 12);
    *((unsigned int *)t16) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 12);
    *((unsigned int *)t11) = t9;
    t10 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t10 & 15U);
    t22 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t22 & 15U);
    t14 = ((char*)((ng1)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_add(t29, 32, t16, 32, t14, 32);
    t17 = (t0 + 2088);
    t18 = (t0 + 2088);
    t19 = (t18 + 72U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng9)));
    t28 = ((char*)((ng10)));
    xsi_vlog_convert_partindices(t31, t32, t33, ((int*)(t20)), 2, t21, 32, 1, t28, 32, 1);
    t30 = (t31 + 4);
    t23 = *((unsigned int *)t30);
    t41 = (!(t23));
    t34 = (t32 + 4);
    t24 = *((unsigned int *)t34);
    t44 = (!(t24));
    t45 = (t41 && t44);
    t35 = (t33 + 4);
    t25 = *((unsigned int *)t35);
    t48 = (!(t25));
    t49 = (t45 && t48);
    if (t49 == 1)
        goto LAB25;

LAB26:    goto LAB18;

LAB19:    t50 = *((unsigned int *)t33);
    t51 = (t50 + 0);
    t52 = *((unsigned int *)t31);
    t53 = *((unsigned int *)t32);
    t54 = (t52 - t53);
    t55 = (t54 + 1);
    xsi_vlogvar_wait_assign_value(t30, t29, t51, *((unsigned int *)t32), t55, 0LL);
    goto LAB20;

LAB21:    t26 = *((unsigned int *)t33);
    t51 = (t26 + 0);
    t27 = *((unsigned int *)t31);
    t40 = *((unsigned int *)t32);
    t54 = (t27 - t40);
    t55 = (t54 + 1);
    xsi_vlogvar_wait_assign_value(t17, t29, t51, *((unsigned int *)t32), t55, 0LL);
    goto LAB22;

LAB23:    t26 = *((unsigned int *)t33);
    t51 = (t26 + 0);
    t27 = *((unsigned int *)t31);
    t40 = *((unsigned int *)t32);
    t54 = (t27 - t40);
    t55 = (t54 + 1);
    xsi_vlogvar_wait_assign_value(t17, t29, t51, *((unsigned int *)t32), t55, 0LL);
    goto LAB24;

LAB25:    t26 = *((unsigned int *)t33);
    t51 = (t26 + 0);
    t27 = *((unsigned int *)t31);
    t40 = *((unsigned int *)t32);
    t54 = (t27 - t40);
    t55 = (t54 + 1);
    xsi_vlogvar_wait_assign_value(t17, t29, t51, *((unsigned int *)t32), t55, 0LL);
    goto LAB26;

LAB28:    xsi_set_current_line(149, ng0);
    t11 = (t0 + 2088);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memset(t16, 0, 8);
    t17 = (t16 + 4);
    t18 = (t14 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (t6 >> 0);
    *((unsigned int *)t16) = t7;
    t8 = *((unsigned int *)t18);
    t9 = (t8 >> 0);
    *((unsigned int *)t17) = t9;
    t10 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t10 & 15U);
    t22 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t22 & 15U);
    t19 = ((char*)((ng1)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 32, t16, 32, t19, 32);
    t20 = (t0 + 2088);
    t21 = (t0 + 2088);
    t28 = (t21 + 72U);
    t30 = *((char **)t28);
    t34 = ((char*)((ng3)));
    t35 = ((char*)((ng2)));
    xsi_vlog_convert_partindices(t31, t32, t33, ((int*)(t30)), 2, t34, 32, 1, t35, 32, 1);
    t36 = (t31 + 4);
    t23 = *((unsigned int *)t36);
    t41 = (!(t23));
    t37 = (t32 + 4);
    t24 = *((unsigned int *)t37);
    t44 = (!(t24));
    t45 = (t41 && t44);
    t38 = (t33 + 4);
    t25 = *((unsigned int *)t38);
    t48 = (!(t25));
    t49 = (t45 && t48);
    if (t49 == 1)
        goto LAB37;

LAB38:    goto LAB36;

LAB30:    xsi_set_current_line(150, ng0);
    t3 = (t0 + 2088);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    memset(t16, 0, 8);
    t12 = (t16 + 4);
    t14 = (t11 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (t6 >> 4);
    *((unsigned int *)t16) = t7;
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 4);
    *((unsigned int *)t12) = t9;
    t10 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t10 & 15U);
    t22 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t22 & 15U);
    t17 = ((char*)((ng1)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 32, t16, 32, t17, 32);
    t18 = (t0 + 2088);
    t19 = (t0 + 2088);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t28 = ((char*)((ng4)));
    t30 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t31, t32, t33, ((int*)(t21)), 2, t28, 32, 1, t30, 32, 1);
    t34 = (t31 + 4);
    t23 = *((unsigned int *)t34);
    t41 = (!(t23));
    t35 = (t32 + 4);
    t24 = *((unsigned int *)t35);
    t44 = (!(t24));
    t45 = (t41 && t44);
    t36 = (t33 + 4);
    t25 = *((unsigned int *)t36);
    t48 = (!(t25));
    t49 = (t45 && t48);
    if (t49 == 1)
        goto LAB39;

LAB40:    goto LAB36;

LAB32:    xsi_set_current_line(151, ng0);
    t3 = (t0 + 2088);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    memset(t16, 0, 8);
    t12 = (t16 + 4);
    t14 = (t11 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (t6 >> 8);
    *((unsigned int *)t16) = t7;
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 8);
    *((unsigned int *)t12) = t9;
    t10 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t10 & 15U);
    t22 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t22 & 15U);
    t17 = ((char*)((ng1)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 32, t16, 32, t17, 32);
    t18 = (t0 + 2088);
    t19 = (t0 + 2088);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t28 = ((char*)((ng7)));
    t30 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t31, t32, t33, ((int*)(t21)), 2, t28, 32, 1, t30, 32, 1);
    t34 = (t31 + 4);
    t23 = *((unsigned int *)t34);
    t41 = (!(t23));
    t35 = (t32 + 4);
    t24 = *((unsigned int *)t35);
    t44 = (!(t24));
    t45 = (t41 && t44);
    t36 = (t33 + 4);
    t25 = *((unsigned int *)t36);
    t48 = (!(t25));
    t49 = (t45 && t48);
    if (t49 == 1)
        goto LAB41;

LAB42:    goto LAB36;

LAB34:    xsi_set_current_line(152, ng0);
    t3 = (t0 + 2088);
    t5 = (t3 + 56U);
    t11 = *((char **)t5);
    memset(t16, 0, 8);
    t12 = (t16 + 4);
    t14 = (t11 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (t6 >> 12);
    *((unsigned int *)t16) = t7;
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 12);
    *((unsigned int *)t12) = t9;
    t10 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t10 & 15U);
    t22 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t22 & 15U);
    t17 = ((char*)((ng1)));
    memset(t29, 0, 8);
    xsi_vlog_unsigned_minus(t29, 32, t16, 32, t17, 32);
    t18 = (t0 + 2088);
    t19 = (t0 + 2088);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t28 = ((char*)((ng9)));
    t30 = ((char*)((ng10)));
    xsi_vlog_convert_partindices(t31, t32, t33, ((int*)(t21)), 2, t28, 32, 1, t30, 32, 1);
    t34 = (t31 + 4);
    t23 = *((unsigned int *)t34);
    t41 = (!(t23));
    t35 = (t32 + 4);
    t24 = *((unsigned int *)t35);
    t44 = (!(t24));
    t45 = (t41 && t44);
    t36 = (t33 + 4);
    t25 = *((unsigned int *)t36);
    t48 = (!(t25));
    t49 = (t45 && t48);
    if (t49 == 1)
        goto LAB43;

LAB44:    goto LAB36;

LAB37:    t26 = *((unsigned int *)t33);
    t51 = (t26 + 0);
    t27 = *((unsigned int *)t31);
    t40 = *((unsigned int *)t32);
    t54 = (t27 - t40);
    t55 = (t54 + 1);
    xsi_vlogvar_wait_assign_value(t20, t29, t51, *((unsigned int *)t32), t55, 0LL);
    goto LAB38;

LAB39:    t26 = *((unsigned int *)t33);
    t51 = (t26 + 0);
    t27 = *((unsigned int *)t31);
    t40 = *((unsigned int *)t32);
    t54 = (t27 - t40);
    t55 = (t54 + 1);
    xsi_vlogvar_wait_assign_value(t18, t29, t51, *((unsigned int *)t32), t55, 0LL);
    goto LAB40;

LAB41:    t26 = *((unsigned int *)t33);
    t51 = (t26 + 0);
    t27 = *((unsigned int *)t31);
    t40 = *((unsigned int *)t32);
    t54 = (t27 - t40);
    t55 = (t54 + 1);
    xsi_vlogvar_wait_assign_value(t18, t29, t51, *((unsigned int *)t32), t55, 0LL);
    goto LAB42;

LAB43:    t26 = *((unsigned int *)t33);
    t51 = (t26 + 0);
    t27 = *((unsigned int *)t31);
    t40 = *((unsigned int *)t32);
    t54 = (t27 - t40);
    t55 = (t54 + 1);
    xsi_vlogvar_wait_assign_value(t18, t29, t51, *((unsigned int *)t32), t55, 0LL);
    goto LAB44;

}


extern void work_m_00000000001380832335_0789812817_init()
{
	static char *pe[] = {(void *)Always_130_0,(void *)Always_138_1};
	xsi_register_didat("work_m_00000000001380832335_0789812817", "isim/test_isim_beh.exe.sim/work/m_00000000001380832335_0789812817.didat");
	xsi_register_executes(pe);
}
