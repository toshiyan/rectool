	  j*  f   k820309              12.0        kIY                                                                                                           
       mygal.f90 UTILS_GALAXY              ERFC LINSPACE gen@LINSPACE+MYUTILS                      @                              
       ERFC                      @                              
       LINSPACE (        `                                                   b               
    #LINSPACE_DBLE%DBLE    #INI    #FIN    #N    p          & p        5 O p            5 O p                                                                          DBLE           
                                       
                
                                       
                
                                             (        `                                                    g               
    #LINSPACE_INT%DBLE 	   #INI 
   #FIN    #N    p          & p        5 O p            5 O p                                                                     	     DBLE           
                                  
                     
                                                       
                                             (        `                                                    i                
    #INI    #N    p          & p        5 O p            5 O p                                    
                                                       
                                             (        `                                                   e                
    #DIV    #N    p          & p        5 O p            5 O p                                    
                                                     
 c   p          & p        p            p                                    
                                             (        `                                                    l                
    #DIV    #N    p          & p        5 O p            5 O p                                    
                                                      j   p          & p        p            p                                    
                                                               @                                '                    #FSKY    #NGAL    #ZM                                                                
                                                              
                                                              
                     @                               '                    #FSKY    #NGAL    #ZM                                                              
                                                
                 ©?        0.05D0                                                             
                                                
                      A@        35.D0                                                             
                                                
                       ð?        1.D0                      @                               '                    #FSKY    #NGAL     #ZM !                                                             
                                                
                       À?        0.125D0                                                              
                                                
                       (@        12.D0                                               !              
                                                
                       à?        0.5D0                      @                          "     '                    #FSKY #   #NGAL $   #ZM %                                              #               
                                                
                       à?        0.5D0                                               $              
                                                
                       Y@        100.D0                                               %              
                                                
                       ø?        1.5D0    %         @                                &                   
       #NZ_SF_SCAL%DEXP '   #Z (   #A )   #B *   #Z0 +                                              '     DEXP           
                                  (     
                
                                  )     
                
                                  *     
                
                                  +     
      (        `                               ,                                   
    #NZ_SF_ARR%SIZE -   #NZ_SF_ARR%DEXP .   #Z /   #A 0   #B 1   #Z0 2   p          H r -     7
S
O p        j            j                                      H r -     7
S
O p        j            j                                                                                               -     SIZE                                            .     DEXP        0  
 @                               /                   
              &                                                     
                                  0     
                
                                  1     
                
                                  2     
      %         @                                 3                   
       #NZ_21CM%DEXP 4   #Z 5   #NZP 6                                              4     DEXP           
                                  5     
                
                                  6                   
    p          & p        p            p                          %         @                                 7                   
       #NZ_21CM_HISTGRAM%SUM 8   #NZ_21CM_HISTGRAM%INT 9   #Z :   #FLUXCUT ;                                              8     SUM                                            9     INT           
                                  :     
                
                                 ;                    1 %         @                                 <                   
       #NZ_DELTA_SCAL%ABS =   #Z >   #ZMEAN ?   #ZWIDTH @                                              =     ABS           
                                  >     
                
                                  ?     
                
                                  @     
      %         @                                A                   
       #PZ_SF_SCAL%DSQRT B   #Z C   #ZI D   #SIGMA E   #ZBIAS F                                              B     DSQRT           
                                  C     
                
                                  D                   
    p          & p        p            p                                    
                                  E     
                
                                  F     
      (        `                                G                    
               
    #PZ_SF_ARR%SIZE H   #Z I   #ZI J   #SIGMA K   #ZBIAS L   p          H r H     7
S
O p        j            j                                      H r H     7
S
O p        j            j                                                                                               H     SIZE        0  
 @                               I                   
              &                                                     
  @                               J                   
    p          & p        p            p                                    
  @                               K     
                
  @                               L     
      #         @                                  M                  #ZBIN_SF%DBLE N   #ZBIN_SF%SUM O   #ZBIN_SF%SIZE P   #A Q   #B R   #Z0 S   #ZB T                                              N     DBLE                                            O     SUM                                            P     SIZE           
  @                               Q     
                
  @                               R     
                
  @                               S     
             0  D@                               T                   
               &                                           %         @                                U                    
       #ZB V   #A W   #B X   #Z0 Y   #SIGMA Z   #ZBIAS [             
  @                               V                   
    p          & p        p            p                                    
  @                               W     
                
  @                               X     
                
  @                               Y     
                
  @                               Z     
                
  @                               [     
      #         @                                  \                  #NGAL_SF%SIZE ]   #NGAL ^   #ZB _   #A `   #B a   #Z0 b   #SIGMA c   #ZBIAS d                                              ]     SIZE           D@                               ^                   
               &                                                     
 @                               _                   
              &                                                     
  @                               `     
                
  @                               a     
                
  @                               b     
                
  @                               c     
                
  @                               d     
                   fn#fn "   ¿   3   b   uapp(UTILS_GALAXY    ò   E   J  FUNCS    7  I   J  MYUTILS &     õ       LINSPACE_DBLE+MYUTILS 0   u  =      LINSPACE_DBLE%DBLE+MYUTILS=DBLE *   ²  @   a   LINSPACE_DBLE%INI+MYUTILS *   ò  @   a   LINSPACE_DBLE%FIN+MYUTILS (   2  @   a   LINSPACE_DBLE%N+MYUTILS %   r  ô       LINSPACE_INT+MYUTILS /   f  =      LINSPACE_INT%DBLE+MYUTILS=DBLE )   £  @   a   LINSPACE_INT%INI+MYUTILS )   ã  @   a   LINSPACE_INT%FIN+MYUTILS '   #  @   a   LINSPACE_INT%N+MYUTILS ,   c  Ô       LINSPACE_INT_SIMPLE+MYUTILS 0   7  @   a   LINSPACE_INT_SIMPLE%INI+MYUTILS .   w  @   a   LINSPACE_INT_SIMPLE%N+MYUTILS *   ·  Ô       LINSPACE_DBLE_DIV+MYUTILS .     ¤   a   LINSPACE_DBLE_DIV%DIV+MYUTILS ,   /  @   a   LINSPACE_DBLE_DIV%N+MYUTILS )   o  Ô       LINSPACE_INT_DIV+MYUTILS -   C	  ¤   a   LINSPACE_INT_DIV%DIV+MYUTILS +   ç	  @   a   LINSPACE_INT_DIV%N+MYUTILS    '
  l       GALAXY_SURVEY #   
  H   a   GALAXY_SURVEY%FSKY #   Û
  H   a   GALAXY_SURVEY%NGAL !   #  H   a   GALAXY_SURVEY%ZM    k  l       HSC    ×  ª   a   HSC%FSKY      ©   a   HSC%NGAL    *  ¨   a   HSC%ZM    Ò  l       DES    >  «   a   DES%FSKY    é  ©   a   DES%NGAL      ©   a   DES%ZM    ;  l       LSST    §  ©   a   LSST%FSKY    P  ª   a   LSST%NGAL    ú  ©   a   LSST%ZM    £         NZ_SF_SCAL     %  =      NZ_SF_SCAL%DEXP    b  @   a   NZ_SF_SCAL%Z    ¢  @   a   NZ_SF_SCAL%A    â  @   a   NZ_SF_SCAL%B    "  @   a   NZ_SF_SCAL%Z0    b  ©      NZ_SF_ARR      =      NZ_SF_ARR%SIZE    H  =      NZ_SF_ARR%DEXP         a   NZ_SF_ARR%Z      @   a   NZ_SF_ARR%A    Q  @   a   NZ_SF_ARR%B      @   a   NZ_SF_ARR%Z0    Ñ  r       NZ_21CM    C  =      NZ_21CM%DEXP      @   a   NZ_21CM%Z    À  ¤   a   NZ_21CM%NZP !   d         NZ_21CM_HISTGRAM %   ü  <      NZ_21CM_HISTGRAM%SUM %   8  <      NZ_21CM_HISTGRAM%INT #   t  @   a   NZ_21CM_HISTGRAM%Z )   ´  L   a   NZ_21CM_HISTGRAM%FLUXCUT              NZ_DELTA_SCAL "     <      NZ_DELTA_SCAL%ABS     Á  @   a   NZ_DELTA_SCAL%Z $     @   a   NZ_DELTA_SCAL%ZMEAN %   A  @   a   NZ_DELTA_SCAL%ZWIDTH             PZ_SF_SCAL !     >      PZ_SF_SCAL%DSQRT    J  @   a   PZ_SF_SCAL%Z      ¤   a   PZ_SF_SCAL%ZI !   .  @   a   PZ_SF_SCAL%SIGMA !   n  @   a   PZ_SF_SCAL%ZBIAS    ®        PZ_SF_ARR    K   =      PZ_SF_ARR%SIZE          a   PZ_SF_ARR%Z    !  ¤   a   PZ_SF_ARR%ZI     ¸!  @   a   PZ_SF_ARR%SIGMA     ø!  @   a   PZ_SF_ARR%ZBIAS    8"         ZBIN_SF    Ó"  =      ZBIN_SF%DBLE    #  <      ZBIN_SF%SUM    L#  =      ZBIN_SF%SIZE    #  @   a   ZBIN_SF%A    É#  @   a   ZBIN_SF%B    	$  @   a   ZBIN_SF%Z0    I$     a   ZBIN_SF%ZB    Õ$         INTEG_SF    Y%  ¤   a   INTEG_SF%ZB    ý%  @   a   INTEG_SF%A    =&  @   a   INTEG_SF%B    }&  @   a   INTEG_SF%Z0    ½&  @   a   INTEG_SF%SIGMA    ý&  @   a   INTEG_SF%ZBIAS    ='         NGAL_SF    Õ'  =      NGAL_SF%SIZE    (     a   NGAL_SF%NGAL    (     a   NGAL_SF%ZB    *)  @   a   NGAL_SF%A    j)  @   a   NGAL_SF%B    ª)  @   a   NGAL_SF%Z0    ê)  @   a   NGAL_SF%SIGMA    **  @   a   NGAL_SF%ZBIAS 