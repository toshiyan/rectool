	  4J  ¡   k820309              12.0        kIY                                                                                                           
       cmblbisp.f90 CMBLBISP              PI NEIGHB SPLINE C_Z H_Z NONLINRATIOS DZ_ARRAY PK2SIGMA                                                     
       PI                      @                              
       NEIGHB SPLINE                      @                              
       C_Z H_Z NONLINRATIOS DZ_ARRAY PK2SIGMA #         @                                                    #PREP_LENS_BISPECTRUM%DSQRT    #PREP_LENS_BISPECTRUM%SIZE    #Z    #DZ    #ZS 	   #H0 
   #OV    #OM    #W0    #WA    #FNU    #KI    #PKLIN0    #MODEL    #KL    #PL    #FAC    #ABC    #WP    #CK                                                    DSQRT                                                 SIZE           
 @                                                  
              &                                                     
                                                     
              &                                                     
  @                               	     
                
                                  
     
                
  @                                    
                
  @                                    
                
  @                                    
                
  @                                    
                
  @                                    
                
 @                                                  
              &                                                     
                                                     
              &                                                     
  @                                                  1           D @                                                  
               &                   &                                                     D @                                                  
               &                   &                                                     D                                                    
               &                                                     D @                                                  
               &                   &                   &                                                     D @                                                  
 	              &                   &                                                     D @                                                  
 
              &                   &                                           #         @                                                   #LIMBER_K2L%DBLE    #LIMBER_K2L%SIZE    #CHI    #K    #PK    #KL    #PL                                                     DBLE                                                 SIZE           
                                                     
              &                                                     
  @                                                  
              &                                                     
 @                                                  
              &                   &                                                     D@                                                  
               &                   &                                                     D                                                     
               &                   &                                           #         @                                 !                  #PRECOMPUTE_COEFF_ABC%DSQRT "   #PRECOMPUTE_COEFF_ABC%SIZE #   #SZ $   #KL %   #KI &   #PLI '   #ABC (   #MODEL )                                              "     DSQRT                                            #     SIZE           
                                  $                   
 G             &                                                     
 @                               %                   
 H             &                   &                                                     
  @                               &                   
 E             &                                                     
  @                               '                   
 F             &                   &                                                     D                                 (                   
 I              &                   &                   &                                                     
                                 )                    1 #         @                                 *                  #PRECOMPUTE_POSTBORN%SUM +   #PRECOMPUTE_POSTBORN%SIZE ,   #DCHI -   #CHI .   #CHIS /   #WLF 0   #KL 1   #PL 2   #WP 3   #CK 4                                              +     SUM                                            ,     SIZE           
                                  -                   
 M             &                                                     
                                  .                   
 N             &                                                     
                                  /     
                
                                  0                   
 O             &                                                     
 @                               1                   
 P             &                   &                                                     
                                  2                   
 Q             &                   &                                                     D                                 3                   
 R              &                   &                                                     D                                 4                   
 S              &                   &                                           #         @                                 5                  #GET_NEFF%SIZE 6   #K 7   #KL 8   #PLIN 9   #N :                                              6     SIZE           
  @                               7                   
              &                                                     
 @                               8                   
              &                   &                                                     
                                  9                   
              &                   &                                                     D                                 :                   
               &                   &                                           %         @                                ;                   
       #W3J_APPROX%EXP <   #W3J_APPROX%DBLE =   #W3J_APPROX%DSQRT >   #L1 ?   #L2 @   #L3 A                                              <     EXP                                            =     DBLE                                            >     DSQRT           
                                  ?     
                
                                  @     
                
                                  A     
      #         @                                 B                   #K C   #P1 D   #P2 E   #F2K F             
                                  C                   
    p          p            p                                    
                                  D                   
    p          p            p                                    
                                  E                   
    p          p            p                                    D                                 F     
       #         @                                  G                  #PRECOMPUTE_W3J%MOD H   #PRECOMPUTE_W3J%ABS I   #PRECOMPUTE_W3J%DBLE J   #PRECOMPUTE_W3J%DSQRT K   #PRECOMPUTE_W3J%SIZE L   #LMIN M   #W3 N                                              H     MOD                                            I     ABS                                            J     DBLE                                            K     DSQRT                                            L     SIZE           
                                  M                     D@                               N                   
               &                   &                   &                                           #         @                                  O               
   #BISP_EQUI%SUM P   #BISP_EQUI%PRESENT Q   #BISP_EQUI%MOD R   #BISP_EQUI%DBLE S   #BISP_EQUI%DSQRT T   #BISP_EQUI%SIZE U   #EL V   #K W   #PK X   #FAC Y   #ABC Z   #WP [   #CK \   #BL ]   #BTYPE ^   #LTYPE _                                              P     SUM                                            Q     PRESENT                                            R     MOD                                            S     DBLE                                            T     DSQRT                                            U     SIZE           
                                  V                       p          p            p                                    
 @                               W                   
              &                   &                                                     
                                  X                   
               &                   &                                                     
                                  Y                   
 !             &                                                     
                                  Z                   
 "             &                   &                   &                                                     
                                  [                   
 #             &                   &                                                     
                                  \                   
 $             &                   &                                                     D                                 ]                   
 %              &                                                     
 @                              ^                    1           
 @                              _                    1 #         @                                  `               
   #BISP_FOLD%SUM a   #BISP_FOLD%PRESENT b   #BISP_FOLD%DBLE c   #BISP_FOLD%DSQRT d   #BISP_FOLD%SIZE e   #EL f   #K g   #PK h   #FAC i   #ABC j   #WP k   #CK l   #BL m   #BTYPE n   #LTYPE o                                              a     SUM                                            b     PRESENT                                            c     DBLE                                            d     DSQRT                                            e     SIZE           
                                  f                    &   p          p            p                                    
 @                               g                   
 '             &                   &                                                     
                                  h                   
 (             &                   &                                                     
                                  i                   
 )             &                                                     
                                  j                   
 *             &                   &                   &                                                     
                                  k                   
 +             &                   &                                                     
                                  l                   
 ,             &                   &                                                     D                                 m                   
 -              &                                                     
 @                              n                    1           
 @                              o                    1 #         @                                  p                  #BISP_SQUE%MAX q   #BISP_SQUE%PRESENT r   #BISP_SQUE%DBLE s   #BISP_SQUE%DSQRT t   #BISP_SQUE%SIZE u   #EL v   #K w   #PK x   #FAC y   #ABC z   #WP {   #CK |   #L0 }   #BL ~   #BTYPE    #LTYPE                                               q     MAX                                            r     PRESENT                                            s     DBLE                                            t     DSQRT                                            u     SIZE           
                                  v                    /   p          p            p                                    
 @                               w                   
 0             &                   &                                                     
                                  x                   
 1             &                   &                                                     
                                  y                   
 2             &                                                     
                                  z                   
 3             &                   &                   &                                                     
  @                               {                   
 4             &                   &                                                     
  @                               |                   
 5             &                   &                                                     
  @                               }                     D                                 ~                   
 6              &                                                     
 @                                                  1           
 @                                                  1 #         @                                                   #BISP_POSTBORN%SUM    #BISP_POSTBORN%DBLE    #L1    #L2    #L3    #WP    #CK    #BISP                                                    SUM                                                 DBLE           
  @                                                    
  @                                                    
  @                                                    
                                                     
 8             &                   &                                                     
                                                     
 9             &                   &                                                     D                                      
       #         @                                                    #SUM_BISP%PRESENT    #SUM_BISP%MOD    #SUM_BISP%ABS    #SUM_BISP%DBLE    #SUM_BISP%DSQRT    #L1    #LMAX    #ZN    #K    #PK    #CL    #FAC    #ABC    #SNR    #BL    #SS                                                    PRESENT                                                 MOD                                                 ABS                                                 DBLE                                                 DSQRT           
  @                                                    
                                                       
                                                       
                                                     
 :             &                   &                                                     
                                                     
 ;             &                   &                                                     
                                                     
 <             &                                                     
                                                     
 =             &                                                     
                                                     
 >             &                   &                   &                                                     D                                      
                 D                                                    
 ?              &                   &                                                     F @                                                  
 @              &                   &                                           #         @                                                   #GET_KNL%SIZE    #K    #PK    #KNL                                                    SIZE           
 @                                                  
 B             &                                                     
 @                                                  
 C             &                   &                                                     D                                                    
 D              &                                                        fn#fn    ¾   H   b   uapp(CMBLBISP      C   J  MYCONST    I  N   J  MYUTILS      g   J  MYFUNC %   þ         PREP_LENS_BISPECTRUM +     >      PREP_LENS_BISPECTRUM%DSQRT *   \  =      PREP_LENS_BISPECTRUM%SIZE '        a   PREP_LENS_BISPECTRUM%Z (   %     a   PREP_LENS_BISPECTRUM%DZ (   ±  @   a   PREP_LENS_BISPECTRUM%ZS (   ñ  @   a   PREP_LENS_BISPECTRUM%H0 (   1  @   a   PREP_LENS_BISPECTRUM%OV (   q  @   a   PREP_LENS_BISPECTRUM%OM (   ±  @   a   PREP_LENS_BISPECTRUM%W0 (   ñ  @   a   PREP_LENS_BISPECTRUM%WA )   1  @   a   PREP_LENS_BISPECTRUM%FNU (   q     a   PREP_LENS_BISPECTRUM%KI ,   ý     a   PREP_LENS_BISPECTRUM%PKLIN0 +     L   a   PREP_LENS_BISPECTRUM%MODEL (   Õ  ¤   a   PREP_LENS_BISPECTRUM%KL (   y  ¤   a   PREP_LENS_BISPECTRUM%PL )   	     a   PREP_LENS_BISPECTRUM%FAC )   ©	  ¼   a   PREP_LENS_BISPECTRUM%ABC (   e
  ¤   a   PREP_LENS_BISPECTRUM%WP (   	  ¤   a   PREP_LENS_BISPECTRUM%CK    ­         LIMBER_K2L     G  =      LIMBER_K2L%DBLE       =      LIMBER_K2L%SIZE    Á     a   LIMBER_K2L%CHI    M     a   LIMBER_K2L%K    Ù  ¤   a   LIMBER_K2L%PK    }  ¤   a   LIMBER_K2L%KL    !  ¤   a   LIMBER_K2L%PL %   Å  ¼       PRECOMPUTE_COEFF_ABC +     >      PRECOMPUTE_COEFF_ABC%DSQRT *   ¿  =      PRECOMPUTE_COEFF_ABC%SIZE (   ü     a   PRECOMPUTE_COEFF_ABC%SZ (     ¤   a   PRECOMPUTE_COEFF_ABC%KL (   ,     a   PRECOMPUTE_COEFF_ABC%KI )   ¸  ¤   a   PRECOMPUTE_COEFF_ABC%PLI )   \  ¼   a   PRECOMPUTE_COEFF_ABC%ABC +     L   a   PRECOMPUTE_COEFF_ABC%MODEL $   d  É       PRECOMPUTE_POSTBORN (   -  <      PRECOMPUTE_POSTBORN%SUM )   i  =      PRECOMPUTE_POSTBORN%SIZE )   ¦     a   PRECOMPUTE_POSTBORN%DCHI (   2     a   PRECOMPUTE_POSTBORN%CHI )   ¾  @   a   PRECOMPUTE_POSTBORN%CHIS (   þ     a   PRECOMPUTE_POSTBORN%WLF '     ¤   a   PRECOMPUTE_POSTBORN%KL '   .  ¤   a   PRECOMPUTE_POSTBORN%PL '   Ò  ¤   a   PRECOMPUTE_POSTBORN%WP '   v  ¤   a   PRECOMPUTE_POSTBORN%CK      {       GET_NEFF      =      GET_NEFF%SIZE    Ò     a   GET_NEFF%K    ^  ¤   a   GET_NEFF%KL      ¤   a   GET_NEFF%PLIN    ¦  ¤   a   GET_NEFF%N    J  §       W3J_APPROX    ñ  <      W3J_APPROX%EXP     -  =      W3J_APPROX%DBLE !   j  >      W3J_APPROX%DSQRT    ¨  @   a   W3J_APPROX%L1    è  @   a   W3J_APPROX%L2    (  @   a   W3J_APPROX%L3    h  h       F2_KERNEL    Ð     a   F2_KERNEL%K    d      a   F2_KERNEL%P1    ø      a   F2_KERNEL%P2    !  @   a   F2_KERNEL%F2K    Ì!  Ö       PRECOMPUTE_W3J #   ¢"  <      PRECOMPUTE_W3J%MOD #   Þ"  <      PRECOMPUTE_W3J%ABS $   #  =      PRECOMPUTE_W3J%DBLE %   W#  >      PRECOMPUTE_W3J%DSQRT $   #  =      PRECOMPUTE_W3J%SIZE $   Ò#  @   a   PRECOMPUTE_W3J%LMIN "   $  ¼   a   PRECOMPUTE_W3J%W3    Î$        BISP_EQUI    ç%  <      BISP_EQUI%SUM "   #&  @      BISP_EQUI%PRESENT    c&  <      BISP_EQUI%MOD    &  =      BISP_EQUI%DBLE     Ü&  >      BISP_EQUI%DSQRT    '  =      BISP_EQUI%SIZE    W'     a   BISP_EQUI%EL    ë'  ¤   a   BISP_EQUI%K    (  ¤   a   BISP_EQUI%PK    3)     a   BISP_EQUI%FAC    ¿)  ¼   a   BISP_EQUI%ABC    {*  ¤   a   BISP_EQUI%WP    +  ¤   a   BISP_EQUI%CK    Ã+     a   BISP_EQUI%BL     O,  L   a   BISP_EQUI%BTYPE     ,  L   a   BISP_EQUI%LTYPE    ç,        BISP_FOLD    í-  <      BISP_FOLD%SUM "   ).  @      BISP_FOLD%PRESENT    i.  =      BISP_FOLD%DBLE     ¦.  >      BISP_FOLD%DSQRT    ä.  =      BISP_FOLD%SIZE    !/     a   BISP_FOLD%EL    µ/  ¤   a   BISP_FOLD%K    Y0  ¤   a   BISP_FOLD%PK    ý0     a   BISP_FOLD%FAC    1  ¼   a   BISP_FOLD%ABC    E2  ¤   a   BISP_FOLD%WP    é2  ¤   a   BISP_FOLD%CK    3     a   BISP_FOLD%BL     4  L   a   BISP_FOLD%BTYPE     e4  L   a   BISP_FOLD%LTYPE    ±4        BISP_SQUE    ¿5  <      BISP_SQUE%MAX "   û5  @      BISP_SQUE%PRESENT    ;6  =      BISP_SQUE%DBLE     x6  >      BISP_SQUE%DSQRT    ¶6  =      BISP_SQUE%SIZE    ó6     a   BISP_SQUE%EL    7  ¤   a   BISP_SQUE%K    +8  ¤   a   BISP_SQUE%PK    Ï8     a   BISP_SQUE%FAC    [9  ¼   a   BISP_SQUE%ABC    :  ¤   a   BISP_SQUE%WP    »:  ¤   a   BISP_SQUE%CK    _;  @   a   BISP_SQUE%L0    ;     a   BISP_SQUE%BL     +<  L   a   BISP_SQUE%BTYPE     w<  L   a   BISP_SQUE%LTYPE    Ã<  ©       BISP_POSTBORN "   l=  <      BISP_POSTBORN%SUM #   ¨=  =      BISP_POSTBORN%DBLE !   å=  @   a   BISP_POSTBORN%L1 !   %>  @   a   BISP_POSTBORN%L2 !   e>  @   a   BISP_POSTBORN%L3 !   ¥>  ¤   a   BISP_POSTBORN%WP !   I?  ¤   a   BISP_POSTBORN%CK #   í?  @   a   BISP_POSTBORN%BISP    -@        SUM_BISP !   2A  @      SUM_BISP%PRESENT    rA  <      SUM_BISP%MOD    ®A  <      SUM_BISP%ABS    êA  =      SUM_BISP%DBLE    'B  >      SUM_BISP%DSQRT    eB  @   a   SUM_BISP%L1    ¥B  @   a   SUM_BISP%LMAX    åB  @   a   SUM_BISP%ZN    %C  ¤   a   SUM_BISP%K    ÉC  ¤   a   SUM_BISP%PK    mD     a   SUM_BISP%CL    ùD     a   SUM_BISP%FAC    E  ¼   a   SUM_BISP%ABC    AF  @   a   SUM_BISP%SNR    F  ¤   a   SUM_BISP%BL    %G  ¤   a   SUM_BISP%SS    ÉG  r       GET_KNL    ;H  =      GET_KNL%SIZE    xH     a   GET_KNL%K    I  ¤   a   GET_KNL%PK    ¨I     a   GET_KNL%KNL 