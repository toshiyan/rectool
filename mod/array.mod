	  �%  E   k820309              12.0        S�Y                                                                                                           
       array.f90 ARRAY              DL DLC IU                                                        u #VEC2MAT_DBLE    #VEC2MAT_CMPLX    #VEC2MAT_DIAG                                                           u #MAPCUT_DBLE    #MAPCUT_CMPLX                                                      KIND (        `    X                                                               
    #VEC2MAT_DBLE%SIZE    #A    #B 	     p        H r      7
S
O p        j            j                                  p          H r      7
S
O p        j            j                                    H r      7
S
O p        j            j                                      H r      7
S
O p        j            j                                    H r      7
S
O p        j            j                                                                                                    SIZE        0  
 @                                                  
              &                                                  0  
 @                               	                   
              &                                           (        `    X                                                                   #VEC2MAT_CMPLX%SIZE 
   #A    #B      p        H r 
     7SO p        j            j                                  p          H r 
     7SO p        j            j                                    H r 
     7SO p        j            j                                      H r 
     7SO p        j            j                                    H r 
     7SO p        j            j                                                                                               
     SIZE        0  
 @                                                               &                                                  0  
 @                                                               &                                           (        `    X                                                               
    #VEC2MAT_DIAG%SIZE    #VEC      p        H r      7
S
O p        j            j                                  p          H r      7
S
O p        j            j                                    H r      7
S
O p        j            j                                      H r      7
S
O p        j            j                                    H r      7
S
O p        j            j                                                                                                    SIZE        0  
 @                                                  
 	             &                                           #         @      X                                             #MAPCUT_DBLE%TRANSPOSE    #MAPCUT_DBLE%RESHAPE    #IMAP    #MM    #OMAP    #NN                                                    TRANSPOSE                                                 RESHAPE           
  @                                                  
              &                                                     
  @   �                                                   p          & p        p            p                                    D                                                    
               &                                                     
      �                                                   p          & p        p            p                          #         @      X                                              #MAPCUT_CMPLX%AIMAG    #MAPCUT_CMPLX%DBLE    #IMAP    #MM    #OMAP    #NN                                                    AIMAG                                                 DBLE           
  @                                                               &                                                     
  @   �                                                   p          & p        p            p                                    D                                                                  &                                                     
  @   �                                                   p          & p        p            p                          #         @                                                    #MAP_FINER_2%TRANSPOSE    #MAP_FINER_2%RESHAPE    #CC    #FF    #CMAP     #FMAP !                                                   TRANSPOSE                                                 RESHAPE           
      �                                                   p          & p        p            p                                    
      �                                                   p          & p        p            p                                    
  @                                                   
              &                                                     D                                 !                   
               &                                           %         @                                "                           #I #   #N $             
                                  #                     
                                  $           %         @                                 %                           #I &   #J '   #N (             
  @                               &                     
  @                               '                     
  @                               (           #         @                                  )                  #SYMMETRIC%SIZE *   #M +                                              *     SIZE           
D@                               +                   
               &                   &                                           (        `                                ,                                     
    #N -     p        5 O p        p          5 O p          5 O p            5 O p          5 O p                                    
                                  -           #         @                                  .                  #INV_GAUSS_JORDAN%DSQRT /   #INV_GAUSS_JORDAN%SIZE 0   #K 1                                              /     DSQRT                                            0     SIZE        0  
D@                               1                   
 !              &                   &                                           #         @                                 2                  #GAUSSJ2%ABS 3   #GAUSSJ2%SIZE 4   #A 5   #N 6   #B 7   #M 8                                              3     ABS                                            4     SIZE           D@                              5                   
 (              &                   &                                                                                      6                      D@                              7                   
 )              &                   &                                                                                      8            #         @                                  9                  #SORT_1D%SIZE :   #REFVAL ;   #II <                                              :     SIZE           
D@                               ;                   
 .              &                                                     D                                 <                    -              &                                           #         @                                  =                  #SORT_2D%SIZE >   #REFVAL ?   #II @   #JJ A                                              >     SIZE           
D@                               ?                   
 2              &                   &                                                     
D                                 @                    0              &                                                     
D                                 A                    1              &                                              �         fn#fn    �      b   uapp(ARRAY    �   w       gen@VEC2MAT    I  c       gen@MAPCUT    �  =       KIND    �  �      VEC2MAT_DBLE "   �  =      VEC2MAT_DBLE%SIZE      �   a   VEC2MAT_DBLE%A    �  �   a   VEC2MAT_DBLE%B    '  �      VEC2MAT_CMPLX #   	  =      VEC2MAT_CMPLX%SIZE     N	  �   a   VEC2MAT_CMPLX%A     �	  �   a   VEC2MAT_CMPLX%B    f
  �      VEC2MAT_DIAG "   J  =      VEC2MAT_DIAG%SIZE !   �  �   a   VEC2MAT_DIAG%VEC      �       MAPCUT_DBLE &   �  B      MAPCUT_DBLE%TRANSPOSE $   �  @      MAPCUT_DBLE%RESHAPE !   5  �   a   MAPCUT_DBLE%IMAP    �  �   a   MAPCUT_DBLE%MM !   e  �   a   MAPCUT_DBLE%OMAP    �  �   a   MAPCUT_DBLE%NN    �  �       MAPCUT_CMPLX #   0  >      MAPCUT_CMPLX%AIMAG "   n  =      MAPCUT_CMPLX%DBLE "   �  �   a   MAPCUT_CMPLX%IMAP     7  �   a   MAPCUT_CMPLX%MM "   �  �   a   MAPCUT_CMPLX%OMAP     g  �   a   MAPCUT_CMPLX%NN      �       MAP_FINER_2 &   �  B      MAP_FINER_2%TRANSPOSE $   �  @      MAP_FINER_2%RESHAPE    -  �   a   MAP_FINER_2%CC    �  �   a   MAP_FINER_2%FF !   u  �   a   MAP_FINER_2%CMAP !     �   a   MAP_FINER_2%FMAP    �  ^       MDIAG    �  @   a   MDIAG%I    +  @   a   MDIAG%N    k  e       MLAB    �  @   a   MLAB%I      @   a   MLAB%J    P  @   a   MLAB%N    �  c       SYMMETRIC    �  =      SYMMETRIC%SIZE    0  �   a   SYMMETRIC%M    �        MAT_IDENTITY    �  @   a   MAT_IDENTITY%N !   '  �       INV_GAUSS_JORDAN '   �  >      INV_GAUSS_JORDAN%DSQRT &   �  =      INV_GAUSS_JORDAN%SIZE #   (  �   a   INV_GAUSS_JORDAN%K    �  �       GAUSSJ2    S  <      GAUSSJ2%ABS    �  =      GAUSSJ2%SIZE    �  �   a   GAUSSJ2%A    p   @   a   GAUSSJ2%N    �   �   a   GAUSSJ2%B    T!  @   a   GAUSSJ2%M    �!  n       SORT_1D    "  =      SORT_1D%SIZE    ?"  �   a   SORT_1D%REFVAL    �"  �   a   SORT_1D%II    W#  v       SORT_2D    �#  =      SORT_2D%SIZE    
$  �   a   SORT_2D%REFVAL    �$  �   a   SORT_2D%II    :%  �   a   SORT_2D%JJ 