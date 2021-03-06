      SUBROUTINE cr_eomccsd_t_N2(a_i0,d_f1,d_i1_1,d_i1_2,d_i1_3,d_i1_4,d
     &_i1_5,d_i1_6,d_t1,d_t2,d_v2,d_x1,d_x2,k_f1_offset,k_i1_offset_1,k_
     &i1_offset_2,k_i1_offset_3,k_i1_offset_4,k_i1_offset_5,k_i1_offset_
     &6,k_t1_offset,k_t2_offset,k_v2_offset,k_x1_offset,k_x2_offset,l_i1
     &_offset_1,l_i1_offset_2,l_i1_offset_3,l_i1_offset_4,l_i1_offset_5,
     &l_i1_offset_6,t_h1b,t_h2b,t_h3b,t_p4b,t_p5b,t_p6b,toggle)
C     $Id$
C     This is a Fortran77 program generated by Tensor Contraction Engine v.1.0
C     Copyright (c) Battelle & Pacific Northwest National Laboratory (2002)
C     i0 ( p4 p5 p6 h1 h2 h3 )_vxt + = -1 * P( 9 ) * Sum ( h12 ) * t ( p4 p5 h1 h12 )_t * i1 ( h12 p6 h2 h3 )_vx
C         i1 ( h12 p4 h1 h2 )_vx + = 1 * Sum ( h13 ) * x ( p4 h13 )_x * i2 ( h12 h13 h1 h2 )_v
C             i2 ( h12 h13 h1 h2 )_v + = -1 * v ( h12 h13 h1 h2 )_v
C             i2 ( h12 h13 h1 h2 )_vt + = 1 * P( 2 ) * Sum ( p9 ) * t ( p9 h1 )_t * i3 ( h12 h13 h2 p9 )_v
C                 i3 ( h12 h13 h1 p9 )_v + = 1 * v ( h12 h13 h1 p9 )_v
C                 i3 ( h12 h13 h1 p9 )_vt + = 1/2 * Sum ( p8 ) * t ( p8 h1 )_t * v ( h12 h13 p8 p9 )_v
C             i2 ( h12 h13 h1 h2 )_vt + = -1/2 * Sum ( p8 p9 ) * t ( p8 p9 h1 h2 )_t * v ( h12 h13 p8 p9 )_v
C         i1 ( h12 p4 h1 h2 )_vx + = -1 * P( 2 ) * Sum ( p8 ) * x ( p8 h1 )_x * v ( h12 p4 h2 p8 )_v
C         i1 ( h12 p4 h1 h2 )_vxt + = 2 * Sum ( h7 ) * t ( p4 h7 )_t * i2 ( h7 h12 h1 h2 )_vx
C             i2 ( h7 h12 h1 h2 )_vx + = -1/2 * P( 2 ) * Sum ( p9 ) * x ( p9 h1 )_x * v ( h7 h12 h2 p9 )_v
C             i2 ( h7 h12 h1 h2 )_vxt + = 1/2 * P( 2 ) * Sum ( p8 ) * t ( p8 h1 )_t * i3 ( h7 h12 h2 p8 )_vx
C                 i3 ( h7 h12 h1 p8 )_vx + = 1 * Sum ( p10 ) * x ( p10 h1 )_x * v ( h7 h12 p8 p10 )_v
C             i2 ( h7 h12 h1 h2 )_vx + = 1/4 * Sum ( p9 p10 ) * x ( p9 p10 h1 h2 )_x * v ( h7 h12 p9 p10 )_v
C         i1 ( h12 p4 h1 h2 )_vxt + = -1 * P( 2 ) * Sum ( p8 ) * t ( p8 h1 )_t * i2 ( h12 p4 h2 p8 )_vx
C             i2 ( h12 p4 h1 p8 )_vx + = -1 * Sum ( p9 ) * x ( p9 h1 )_x * v ( h12 p4 p8 p9 )_v
C         i1 ( h12 p4 h1 h2 )_vxt + = 1 * P( 2 ) * Sum ( h9 p8 ) * t ( p4 p8 h1 h9 )_t * i2 ( h9 h12 h2 p8 )_vx
C             i2 ( h9 h12 h1 p8 )_vx + = -1 * Sum ( p10 ) * x ( p10 h1 )_x * v ( h9 h12 p8 p10 )_v
C         i1 ( h12 p4 h1 h2 )_vxt + = -1 * Sum ( p8 ) * t ( p4 p8 h1 h2 )_t * i2 ( h12 p8 )_vx
C             i2 ( h12 p8 )_vx + = -1 * Sum ( h9 p10 ) * x ( p10 h9 )_x * v ( h9 h12 p8 p10 )_v
C         i1 ( h12 p4 h1 h2 )_fx + = -1 * Sum ( p7 ) * x ( p4 p7 h1 h2 )_x * i2 ( h12 p7 )_f
C             i2 ( h12 p7 )_f + = 1 * f ( h12 p7 )_f
C             i2 ( h12 p7 )_vt + = -1 * Sum ( h9 p8 ) * t ( p8 h9 )_t * v ( h9 h12 p7 p8 )_v
C         i1 ( h12 p4 h1 h2 )_vx + = 1 * P( 2 ) * Sum ( h10 p7 ) * x ( p4 p7 h1 h10 )_x * i2 ( h10 h12 h2 p7 )_v
C             i2 ( h10 h12 h1 p7 )_v + = 1 * v ( h10 h12 h1 p7 )_v
C             i2 ( h10 h12 h1 p7 )_vt + = -1 * Sum ( p8 ) * t ( p8 h1 )_t * v ( h10 h12 p7 p8 )_v
C         i1 ( h12 p4 h1 h2 )_vx + = 1/2 * Sum ( p8 p9 ) * x ( p8 p9 h1 h2 )_x * v ( h12 p4 p8 p9 )_v
C     i0 ( p4 p5 p6 h1 h2 h3 )_vtx + = 6 * P( 3 ) * Sum ( h12 ) * x ( p4 h12 )_x * i1 ( h12 p5 p6 h1 h2 h3 )_vt
C         i1 ( h12 p4 p5 h1 h2 h3 )_vt + = -1/6 * P( 6 ) * Sum ( p7 ) * t ( p4 p7 h1 h2 )_t * i2 ( h12 p5 h3 p7 )_v
C             i2 ( h12 p4 h1 p7 )_v + = 1 * v ( h12 p4 h1 p7 )_v
C             i2 ( h12 p4 h1 p7 )_vt + = 1 * Sum ( h8 ) * t ( p4 h8 )_t * v ( h8 h12 h1 p7 )_v
C             i2 ( h12 p4 h1 p7 )_vt + = -1 * Sum ( p8 ) * t ( p8 h1 )_t * v ( h12 p4 p7 p8 )_v
C             i2 ( h12 p4 h1 p7 )_vt + = 1 * Sum ( h9 p8 ) * t ( p4 p8 h1 h9 )_t * v ( h9 h12 p7 p8 )_v
C     i0 ( p4 p5 p6 h1 h2 h3 )_vxt + = -1 * P( 9 ) * Sum ( p7 ) * t ( p4 p7 h1 h2 )_t * i1 ( p5 p6 h3 p7 )_vx
C         i1 ( p4 p5 h1 p7 )_vx + = -1 * Sum ( p8 ) * x ( p8 h1 )_x * v ( p4 p5 p7 p8 )_v
C         i1 ( p4 p5 h1 p7 )_vxt + = 1/2 * Sum ( h8 h9 ) * t ( p4 p5 h8 h9 )_t * i2 ( h8 h9 h1 p7 )_vx
C             i2 ( h8 h9 h1 p7 )_vx + = -1 * Sum ( p10 ) * x ( p10 h1 )_x * v ( h8 h9 p7 p10 )_v
C         i1 ( p4 p5 h1 p7 )_vx + = 1/2 * Sum ( h11 h12 ) * x ( p4 p5 h11 h12 )_x * i2 ( h11 h12 h1 p7 )_v
C             i2 ( h11 h12 h1 p7 )_v + = 1 * v ( h11 h12 h1 p7 )_v
C             i2 ( h11 h12 h1 p7 )_vt + = -1 * Sum ( p8 ) * t ( p8 h1 )_t * v ( h11 h12 p7 p8 )_v
C         i1 ( p4 p5 h1 p7 )_vx + = -1 * P( 2 ) * Sum ( h8 p9 ) * x ( p4 p9 h1 h8 )_x * v ( h8 p5 p7 p9 )_v
C     i0 ( p4 p5 p6 h1 h2 h3 )_vxtt + = 6 * P( 3 ) * Sum ( h12 ) * t ( p4 h12 )_t * i1 ( h12 p5 p6 h1 h2 h3 )_vxt
C         i1 ( h12 p4 p5 h1 h2 h3 )_vxt + = -1/6 * P( 6 ) * Sum ( p7 ) * t ( p4 p7 h1 h2 )_t * i2 ( h12 p5 h3 p7 )_vx
C             i2 ( h12 p4 h1 p7 )_vx + = -1 * Sum ( p9 ) * x ( p9 h1 )_x * v ( h12 p4 p7 p9 )_v
C             i2 ( h12 p4 h1 p7 )_vtx + = -1 * Sum ( h10 ) * x ( p4 h10 )_x * i3 ( h10 h12 h1 p7 )_vt
C                 i3 ( h10 h12 h1 p7 )_vt + = 1 * Sum ( p8 ) * t ( p8 h1 )_t * v ( h10 h12 p7 p8 )_v
C             i2 ( h12 p4 h1 p7 )_vxt + = 1/2 * Sum ( h8 ) * t ( p4 h8 )_t * i3 ( h8 h12 h1 p7 )_vx
C                 i3 ( h8 h12 h1 p7 )_vx + = -1 * Sum ( p10 ) * x ( p10 h1 )_x * v ( h8 h12 p7 p10 )_v
C             i2 ( h12 p4 h1 p7 )_vx + = 1 * Sum ( h9 p10 ) * x ( p4 p10 h1 h9 )_x * v ( h9 h12 p7 p10 )_v
C         i1 ( h12 p4 p5 h1 h2 h3 )_vx + = -1/6 * P( 6 ) * Sum ( p10 ) * x ( p4 p10 h1 h2 )_x * i2 ( h12 p5 h3 p10 )_v
C             i2 ( h12 p4 h1 p10 )_v + = 1 * v ( h12 p4 h1 p10 )_v
C             i2 ( h12 p4 h1 p10 )_vt + = 1/2 * Sum ( h8 ) * t ( p4 h8 )_t * i3 ( h8 h12 h1 p10 )_v
C                 i3 ( h8 h12 h1 p10 )_v + = 1 * v ( h8 h12 h1 p10 )_v
C                 i3 ( h8 h12 h1 p10 )_vt + = 1 * Sum ( p9 ) * t ( p9 h1 )_t * v ( h8 h12 p9 p10 )_v
C             i2 ( h12 p4 h1 p10 )_vt + = 1 * Sum ( p8 ) * t ( p8 h1 )_t * v ( h12 p4 p8 p10 )_v
C             i2 ( h12 p4 h1 p10 )_vt + = -1 * Sum ( h8 p7 ) * t ( p4 p7 h1 h8 )_t * v ( h8 h12 p7 p10 )_v
C     i0 ( p4 p5 p6 h1 h2 h3 )_xv + = -1 * P( 9 ) * Sum ( h12 ) * x ( p4 p5 h1 h12 )_x * i1 ( h12 p6 h2 h3 )_v
C         i1 ( h12 p4 h1 h2 )_v + = 1 * v ( h12 p4 h1 h2 )_v
C         i1 ( h12 p4 h1 h2 )_vt + = 1 * Sum ( h11 ) * t ( p4 h11 )_t * i2 ( h11 h12 h1 h2 )_v
C             i2 ( h11 h12 h1 h2 )_v + = 1 * v ( h11 h12 h1 h2 )_v
C             i2 ( h11 h12 h1 h2 )_vt + = -1 * P( 2 ) * Sum ( p8 ) * t ( p8 h1 )_t * i3 ( h11 h12 h2 p8 )_v
C                 i3 ( h11 h12 h1 p8 )_v + = 1 * v ( h11 h12 h1 p8 )_v
C                 i3 ( h11 h12 h1 p8 )_vt + = -1/2 * Sum ( p9 ) * t ( p9 h1 )_t * v ( h11 h12 p8 p9 )_v
C             i2 ( h11 h12 h1 h2 )_vt + = 1/2 * Sum ( p7 p8 ) * t ( p7 p8 h1 h2 )_t * v ( h11 h12 p7 p8 )_v
C         i1 ( h12 p4 h1 h2 )_vt + = -1 * P( 2 ) * Sum ( p7 ) * t ( p7 h1 )_t * i2 ( h12 p4 h2 p7 )_v
C             i2 ( h12 p4 h1 p7 )_vt + = -1/2 * Sum ( p8 ) * t ( p8 h1 )_t * v ( h12 p4 p7 p8 )_v
C         i1 ( h12 p4 h1 h2 )_ft + = -1 * Sum ( p10 ) * t ( p4 p10 h1 h2 )_t * i2 ( h12 p10 )_f
C             i2 ( h12 p10 )_f + = 1 * f ( h12 p10 )_f
C             i2 ( h12 p10 )_vt + = 1 * Sum ( h9 p8 ) * t ( p8 h9 )_t * v ( h9 h12 p8 p10 )_v
C         i1 ( h12 p4 h1 h2 )_vt + = 1 * P( 2 ) * Sum ( h8 p7 ) * t ( p4 p7 h1 h8 )_t * i2 ( h8 h12 h2 p7 )_v
C             i2 ( h8 h12 h1 p7 )_v + = 1 * v ( h8 h12 h1 p7 )_v
C             i2 ( h8 h12 h1 p7 )_vt + = -1 * Sum ( p9 ) * t ( p9 h1 )_t * v ( h8 h12 p7 p9 )_v
C         i1 ( h12 p4 h1 h2 )_vt + = 1/2 * Sum ( p7 p8 ) * t ( p7 p8 h1 h2 )_t * v ( h12 p4 p7 p8 )_v
C     i0 ( p4 p5 p6 h1 h2 h3 )_xv + = -1 * P( 9 ) * Sum ( p11 ) * x ( p4 p11 h1 h2 )_x * i1 ( p5 p6 h3 p11 )_v
C         i1 ( p4 p5 h1 p11 )_v + = 1 * v ( p4 p5 h1 p11 )_v
C         i1 ( p4 p5 h1 p11 )_vt + = 1 * Sum ( p7 ) * t ( p7 h1 )_t * v ( p4 p5 p7 p11 )_v
C         i1 ( p4 p5 h1 p11 )_vt + = 1/2 * Sum ( h7 h8 ) * t ( p4 p5 h7 h8 )_t * i2 ( h7 h8 h1 p11 )_v
C             i2 ( h7 h8 h1 p11 )_v + = 1 * v ( h7 h8 h1 p11 )_v
C             i2 ( h7 h8 h1 p11 )_vt + = 1 * Sum ( p9 ) * t ( p9 h1 )_t * v ( h7 h8 p9 p11 )_v
C         i1 ( p4 p5 h1 p11 )_vt + = 1 * P( 2 ) * Sum ( h8 p7 ) * t ( p4 p7 h1 h8 )_t * v ( h8 p5 p7 p11 )_v
      IMPLICIT NONE
#include "global.fh"
#include "mafdecls.fh"
#include "util.fh"
#include "errquit.fh"
#include "tce.fh"
      INTEGER t_p4b
      INTEGER t_p5b
      INTEGER t_p6b
      INTEGER t_h1b
      INTEGER t_h2b
      INTEGER t_h3b
      INTEGER toggle
      INTEGER d_t2
      INTEGER k_t2_offset
      INTEGER d_i1_1
      INTEGER k_i1_offset_1
      INTEGER l_i1_offset_1
      INTEGER d_x1
      INTEGER k_x1_offset
      INTEGER d_i1_2
      INTEGER k_i1_offset_2
      INTEGER l_i1_offset_2
      INTEGER d_i1_3
      INTEGER k_i1_offset_3
      INTEGER l_i1_offset_3
      INTEGER d_t1
      INTEGER k_t1_offset
      INTEGER d_i1_4
      INTEGER k_i1_offset_4
      INTEGER l_i1_offset_4
      INTEGER d_x2
      INTEGER k_x2_offset
      INTEGER d_i1_5
      INTEGER k_i1_offset_5
      INTEGER l_i1_offset_5
      INTEGER d_i1_6
      INTEGER k_i1_offset_6
      INTEGER l_i1_offset_6
      INTEGER d_i2
      INTEGER k_i2_offset
      INTEGER size_i1_1
      INTEGER d_v2
      INTEGER k_v2_offset
      INTEGER l_i2_offset
      INTEGER size_i2
      INTEGER d_i3
      INTEGER k_i3_offset
      INTEGER l_i3_offset
      INTEGER size_i3
      INTEGER d_f1
      INTEGER k_f1_offset
      INTEGER size_i1_2
      INTEGER size_i1_3
      INTEGER size_i1_4
      INTEGER size_i1_5
      INTEGER size_i1_6
      DOUBLE PRECISION a_i0(*)
      CHARACTER*255 filename
      IF (toggle .eq. 3) THEN
      CALL DELETEFILE(d_i1_6)
      IF (.not.MA_POP_STACK(l_i1_offset_6)) CALL ERRQUIT('cr_eomccsd_t_N
     &2',-1,MA_ERR)
      END IF
      IF (toggle .eq. 3) THEN
      CALL DELETEFILE(d_i1_5)
      IF (.not.MA_POP_STACK(l_i1_offset_5)) CALL ERRQUIT('cr_eomccsd_t_N
     &2',-1,MA_ERR)
      END IF
      IF (toggle .eq. 3) THEN
      CALL DELETEFILE(d_i1_4)
      IF (.not.MA_POP_STACK(l_i1_offset_4)) CALL ERRQUIT('cr_eomccsd_t_N
     &2',-1,MA_ERR)
      END IF
      IF (toggle .eq. 3) THEN
      CALL DELETEFILE(d_i1_3)
      IF (.not.MA_POP_STACK(l_i1_offset_3)) CALL ERRQUIT('cr_eomccsd_t_N
     &2',-1,MA_ERR)
      END IF
      IF (toggle .eq. 3) THEN
      CALL DELETEFILE(d_i1_2)
      IF (.not.MA_POP_STACK(l_i1_offset_2)) CALL ERRQUIT('cr_eomccsd_t_N
     &2',-1,MA_ERR)
      END IF
      IF (toggle .eq. 3) THEN
      CALL DELETEFILE(d_i1_1)
      IF (.not.MA_POP_STACK(l_i1_offset_1)) CALL ERRQUIT('cr_eomccsd_t_N
     &2',-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_1_1(l_i1_offset_1,k
     &_i1_offset_1,size_i1_1)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_1_1_i1',file
     &name)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i1_1,size_i1_1)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_1_1_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_1_1_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_1_1(d_v2,k_v2_offset,d_i
     &2,k_i2_offset)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_1_1_2_1(l_i3_offset
     &,k_i3_offset,size_i3)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_1_1_2_1_i3',
     &filename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_1_2_1(d_v2,k_v2_offset,d
     &_i3,k_i3_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_1_2_2(d_t1,k_t1_offset,d
     &_v2,k_v2_offset,d_i3,k_i3_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_1_2(d_t1,k_t1_offset,d_i
     &3,k_i3_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i3)
      IF (.not.MA_POP_STACK(l_i3_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_1_3(d_t2,k_t2_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_1(d_x1,k_x1_offset,d_i2,
     &k_i2_offset,d_i1_1,k_i1_offset_1)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_2(d_x1,k_x1_offset,d_v2,
     &k_v2_offset,d_i1_1,k_i1_offset_1)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_1_3_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_1_3_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_3_1(d_x1,k_x1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_1_3_2_1(l_i3_offset
     &,k_i3_offset,size_i3)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_1_3_2_1_i3',
     &filename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_3_2_1(d_x1,k_x1_offset,d
     &_v2,k_v2_offset,d_i3,k_i3_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_3_2(d_t1,k_t1_offset,d_i
     &3,k_i3_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i3)
      IF (.not.MA_POP_STACK(l_i3_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_3_3(d_x2,k_x2_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_3(d_t1,k_t1_offset,d_i2,
     &k_i2_offset,d_i1_1,k_i1_offset_1)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_1_4_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_1_4_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_4_1(d_x1,k_x1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_4(d_t1,k_t1_offset,d_i2,
     &k_i2_offset,d_i1_1,k_i1_offset_1)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_1_5_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_1_5_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_5_1(d_x1,k_x1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_5(d_t2,k_t2_offset,d_i2,
     &k_i2_offset,d_i1_1,k_i1_offset_1)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_1_6_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_1_6_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_6_1(d_x1,k_x1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_6(d_t2,k_t2_offset,d_i2,
     &k_i2_offset,d_i1_1,k_i1_offset_1)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_1_7_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_1_7_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_7_1(d_f1,k_f1_offset,d_i
     &2,k_i2_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_7_2(d_t1,k_t1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_7(d_x2,k_x2_offset,d_i2,
     &k_i2_offset,d_i1_1,k_i1_offset_1)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_1_8_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_1_8_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_8_1(d_v2,k_v2_offset,d_i
     &2,k_i2_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_8_2(d_t1,k_t1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_8(d_x2,k_x2_offset,d_i2,
     &k_i2_offset,d_i1_1,k_i1_offset_1)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_1_9(d_x2,k_x2_offset,d_v2,
     &k_v2_offset,d_i1_1,k_i1_offset_1)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i1_1,size_i1_1)
      IF (toggle .eq. 2) CALL cr_eomccsd_t_N2_1(d_t2,k_t2_offset,d_i1_1,
     &k_i1_offset_1,a_i0,t_p4b,t_p5b,t_p6b,t_h1b,t_h2b,t_h3b)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_2_1(l_i1_offset_2,k
     &_i1_offset_2,size_i1_2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_2_1_i1',file
     &name)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i1_2,size_i1_2)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_2_1_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_2_1_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_2_1_1(d_v2,k_v2_offset,d_i
     &2,k_i2_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_2_1_2(d_t1,k_t1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_2_1_3(d_t1,k_t1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_2_1_4(d_t2,k_t2_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_2_1(d_t2,k_t2_offset,d_i2,
     &k_i2_offset,d_i1_2,k_i1_offset_2)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i1_2,size_i1_2)
      IF (toggle .eq. 2) CALL cr_eomccsd_t_N2_2(d_x1,k_x1_offset,d_i1_2,
     &k_i1_offset_2,a_i0,t_p4b,t_p5b,t_p6b,t_h1b,t_h2b,t_h3b)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_3_1(l_i1_offset_3,k
     &_i1_offset_3,size_i1_3)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_3_1_i1',file
     &name)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i1_3,size_i1_3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_3_1(d_x1,k_x1_offset,d_v2,
     &k_v2_offset,d_i1_3,k_i1_offset_3)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_3_2_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_3_2_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_3_2_1(d_x1,k_x1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_3_2(d_t2,k_t2_offset,d_i2,
     &k_i2_offset,d_i1_3,k_i1_offset_3)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_3_3_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_3_3_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_3_3_1(d_v2,k_v2_offset,d_i
     &2,k_i2_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_3_3_2(d_t1,k_t1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_3_3(d_x2,k_x2_offset,d_i2,
     &k_i2_offset,d_i1_3,k_i1_offset_3)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_3_4(d_x2,k_x2_offset,d_v2,
     &k_v2_offset,d_i1_3,k_i1_offset_3)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i1_3,size_i1_3)
      IF (toggle .eq. 2) CALL cr_eomccsd_t_N2_3(d_t2,k_t2_offset,d_i1_3,
     &k_i1_offset_3,a_i0,t_p4b,t_p5b,t_p6b,t_h1b,t_h2b,t_h3b)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_4_1(l_i1_offset_4,k
     &_i1_offset_4,size_i1_4)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_4_1_i1',file
     &name)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i1_4,size_i1_4)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_4_1_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_4_1_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_1_1(d_x1,k_x1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_4_1_2_1(l_i3_offset
     &,k_i3_offset,size_i3)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_4_1_2_1_i3',
     &filename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_1_2_1(d_t1,k_t1_offset,d
     &_v2,k_v2_offset,d_i3,k_i3_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_1_2(d_x1,k_x1_offset,d_i
     &3,k_i3_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i3)
      IF (.not.MA_POP_STACK(l_i3_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_4_1_3_1(l_i3_offset
     &,k_i3_offset,size_i3)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_4_1_3_1_i3',
     &filename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_1_3_1(d_x1,k_x1_offset,d
     &_v2,k_v2_offset,d_i3,k_i3_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_1_3(d_t1,k_t1_offset,d_i
     &3,k_i3_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i3)
      IF (.not.MA_POP_STACK(l_i3_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_1_4(d_x2,k_x2_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_1(d_t2,k_t2_offset,d_i2,
     &k_i2_offset,d_i1_4,k_i1_offset_4)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_4_2_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_4_2_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_2_1(d_v2,k_v2_offset,d_i
     &2,k_i2_offset)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_4_2_2_1(l_i3_offset
     &,k_i3_offset,size_i3)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_4_2_2_1_i3',
     &filename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_2_2_1(d_v2,k_v2_offset,d
     &_i3,k_i3_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_2_2_2(d_t1,k_t1_offset,d
     &_v2,k_v2_offset,d_i3,k_i3_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_2_2(d_t1,k_t1_offset,d_i
     &3,k_i3_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i3)
      IF (.not.MA_POP_STACK(l_i3_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_2_3(d_t1,k_t1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_2_4(d_t2,k_t2_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_4_2(d_x2,k_x2_offset,d_i2,
     &k_i2_offset,d_i1_4,k_i1_offset_4)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i1_4,size_i1_4)
      IF (toggle .eq. 2) CALL cr_eomccsd_t_N2_4(d_t1,k_t1_offset,d_i1_4,
     &k_i1_offset_4,a_i0,t_p4b,t_p5b,t_p6b,t_h1b,t_h2b,t_h3b)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_5_1(l_i1_offset_5,k
     &_i1_offset_5,size_i1_5)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_5_1_i1',file
     &name)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i1_5,size_i1_5)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_1(d_v2,k_v2_offset,d_i1_
     &5,k_i1_offset_5)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_5_2_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_5_2_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_2_1(d_v2,k_v2_offset,d_i
     &2,k_i2_offset)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_5_2_2_1(l_i3_offset
     &,k_i3_offset,size_i3)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_5_2_2_1_i3',
     &filename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_2_2_1(d_v2,k_v2_offset,d
     &_i3,k_i3_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_2_2_2(d_t1,k_t1_offset,d
     &_v2,k_v2_offset,d_i3,k_i3_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i3,size_i3)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_2_2(d_t1,k_t1_offset,d_i
     &3,k_i3_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i3)
      IF (.not.MA_POP_STACK(l_i3_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_2_3(d_t2,k_t2_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_2(d_t1,k_t1_offset,d_i2,
     &k_i2_offset,d_i1_5,k_i1_offset_5)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_5_3_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_5_3_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_3_1(d_v2,k_v2_offset,d_i
     &2,k_i2_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_3_2(d_t1,k_t1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_3(d_t1,k_t1_offset,d_i2,
     &k_i2_offset,d_i1_5,k_i1_offset_5)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_5_4_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_5_4_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_4_1(d_f1,k_f1_offset,d_i
     &2,k_i2_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_4_2(d_t1,k_t1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_4(d_t2,k_t2_offset,d_i2,
     &k_i2_offset,d_i1_5,k_i1_offset_5)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_5_5_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_5_5_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_5_1(d_v2,k_v2_offset,d_i
     &2,k_i2_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_5_2(d_t1,k_t1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_5(d_t2,k_t2_offset,d_i2,
     &k_i2_offset,d_i1_5,k_i1_offset_5)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_5_6(d_t2,k_t2_offset,d_v2,
     &k_v2_offset,d_i1_5,k_i1_offset_5)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i1_5,size_i1_5)
      IF (toggle .eq. 2) CALL cr_eomccsd_t_N2_5(d_x2,k_x2_offset,d_i1_5,
     &k_i1_offset_5,a_i0,t_p4b,t_p5b,t_p6b,t_h1b,t_h2b,t_h3b)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_6_1(l_i1_offset_6,k
     &_i1_offset_6,size_i1_6)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_6_1_i1',file
     &name)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i1_6,size_i1_6)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_6_1(d_v2,k_v2_offset,d_i1_
     &6,k_i1_offset_6)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_6_2(d_t1,k_t1_offset,d_v2,
     &k_v2_offset,d_i1_6,k_i1_offset_6)
      IF (toggle .eq. 1) CALL OFFSET_cr_eomccsd_t_N2_6_3_1(l_i2_offset,k
     &_i2_offset,size_i2)
      IF (toggle .eq. 1) CALL TCE_FILENAME('cr_eomccsd_t_N2_6_3_1_i2',fi
     &lename)
      IF (toggle .eq. 1) CALL CREATEFILE(filename,d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_6_3_1(d_v2,k_v2_offset,d_i
     &2,k_i2_offset)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_6_3_2(d_t1,k_t1_offset,d_v
     &2,k_v2_offset,d_i2,k_i2_offset)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i2,size_i2)
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_6_3(d_t2,k_t2_offset,d_i2,
     &k_i2_offset,d_i1_6,k_i1_offset_6)
      IF (toggle .eq. 1) THEN
      CALL DELETEFILE(d_i2)
      IF (.not.MA_POP_STACK(l_i2_offset)) CALL ERRQUIT('cr_eomccsd_t_N2'
     &,-1,MA_ERR)
      END IF
      IF (toggle .eq. 1) CALL cr_eomccsd_t_N2_6_4(d_t2,k_t2_offset,d_v2,
     &k_v2_offset,d_i1_6,k_i1_offset_6)
      IF (toggle .eq. 1) CALL RECONCILEFILE(d_i1_6,size_i1_6)
      IF (toggle .eq. 2) CALL cr_eomccsd_t_N2_6(d_x2,k_x2_offset,d_i1_6,
     &k_i1_offset_6,a_i0,t_p4b,t_p5b,t_p6b,t_h1b,t_h2b,t_h3b)
      RETURN
      END
