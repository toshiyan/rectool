	  i:  ¤   k820309              12.0        kIY                                                                                                           
       readfile.f90 READFILE                                                       u #READ_PRM_INT    #READ_PRM_DBL    #READ_PRM_REAL    #READ_PRM_LOG                                                           u #SET_PRM_ARRAY_INT    #SET_PRM_ARRAY_DBL    #SET_PRM_INT    #SET_PRM_DBL    #SET_PRM_STR 	   #SET_PRM_LOG 
              @                                                                                                                                               128                                                                                                   1024                  @                                '                   #NAME    #VALUE                                                                                                                                                                 @                                '                    #P                                                                         #TNAMEVALUE                      @                                'X                    #COUNT    #DELTA    #CAPACITY    #IGNOREDUPLICATES    #ITEMS                                                                                                                                                                                                                                                                                                                                       #TNAMEVALUE_POINTER              &                                                             @                                '¸                    #SLASHCOMMENTS    #L    #READVALUES                                                                                                                    X                     #TNAMEVALUELIST                                                     X       `              #TNAMEVALUELIST               @ @                                    ¸       #TINIFILE    #         @      X                                             #READ_PRM_INT%ADJUSTL    #READ_PRM_INT%TRIM    #STRING     #PARAMS !                                                   ADJUSTL                                                 TRIM           
  @                                                   1           D                                 !                                  &                                           #         @      X                                             #READ_PRM_DBL%ADJUSTL "   #READ_PRM_DBL%TRIM #   #STRING $   #PARAMS %                                              "     ADJUSTL                                            #     TRIM           
  @                              $                    1           D                                 %                   
               &                                           #         @      X                                              #READ_PRM_REAL%ADJUSTL &   #READ_PRM_REAL%TRIM '   #STRING (   #PARAMS )                                              &     ADJUSTL                                            '     TRIM           
  @                              (                    1           D                                )                   	               &                                           #         @      X                                              #READ_PRM_LOG%ADJUSTL *   #READ_PRM_LOG%TRIM +   #STRING ,   #PARAMS -                                              *     ADJUSTL                                            +     TRIM           
  @                              ,                    1           D                                 -                                  &                                           #         @      X                                              #SET_PRM_ARRAY_INT%TRIM .   #ARGS /   #P 0   #DEF 1                                              .     TRIM           
@ @                              /                    1           D @                               0                                  &                                                     
                                  1                                 &                                           #         @      X                                              #SET_PRM_ARRAY_DBL%TRIM 2   #ARGS 3   #P 4   #DEF 5                                              2     TRIM           
@ @                              3                    1           D @                               4                   
 	              &                                                     
                                  5                   
              &                                           #         @      X                                              #SET_PRM_INT%TRIM 6   #ARGS 7   #P 8   #DEF 9                                              6     TRIM           
  @                              7                    1           D                                 8                      
                                  9           #         @      X                                              #SET_PRM_DBL%TRIM :   #ARGS ;   #P <   #DEF =                                              :     TRIM           
  @                              ;                    1           D                                 <     
                 
                                  =     
      #         @      X                            	                  #SET_PRM_STR%TRIM >   #ARGS ?   #P @   #DEF A                                              >     TRIM           
  @                              ?                    1           D @                              @                     1           
                                 A                    1 #         @      X                            
                  #SET_PRM_LOG%TRIM B   #ARGS C   #P D   #DEF E                                              B     TRIM           
  @                              C                    1           D                                 D                      
                                  E           #         @                                  F                   #SET_PARAMS_FILE%COMMAND_ARGUMENT_COUNT G                                                                                        G     COMMAND_ARGUMENT_COUNT #         @                                 H                  #INI_OPEN%PRESENT I   #INI_OPEN%TRIM J   #FILENAME K   #UNIT_ID L   #ERROR M   #SLASH_COMMENTS N                                              I     PRESENT                                            J     TRIM           
  @                              K                    1           
  @                               L                     F @                               M                      
 @                               N           $         @                               O                           #KEY P                     
  @                              P                    1 $         @                                Q                           #INI R   #KEY S                     
@ @                               R     ¸              #TINIFILE              
  @                              S                    1 %         @                                T                           #KEY U             
  @                              U                    1 %         @                                V                          #INI_READ_INT_FILE%VERIFY W   #INI_READ_INT_FILE%TRIM X   #INI Y   #KEY Z                                              W     VERIFY                                            X     TRIM           
  @                               Y     ¸              #TINIFILE              
  @                              Z                    1 %         @                                 [                    	       #KEY \             
  @                              \                    1 %         @                                ]                    	       #INI ^   #KEY _             
  @                               ^     ¸              #TINIFILE              
  @                              _                    1 %         @                                `                           #KEY a             
  @                              a                    1 %         @                                b                          #INI_READ_LOG_FILE%VERIFY c   #INI_READ_LOG_FILE%TRIM d   #INI e   #KEY f                                              c     VERIFY                                            d     TRIM           
  @                               e     ¸              #TINIFILE              
  @                              f                    1 %         @                                g                    
       #KEY h             
  @                              h                    1 %         @                                i                    
       #INI j   #KEY k             
  @                               j     ¸              #TINIFILE              
  @                              k                    1 %         @                                l                           #KEY m             
  @                              m                    1 %         @                                n                           #L o   #ANAME p             
                                  o     X              #TNAMEVALUELIST              
                                 p                    1 #         @                                 q                   #L r   #ANAME s   #AVALUE t             
                                  r     X              #TNAMEVALUELIST              
                                 s                    1           D                                t                     1 #         @                                 u                  #TNAMEVALUELIST_ADD%TRIM v   #L w   #ANAME x   #AVALUE y                                              v     TRIM           D @                               w     X               #TNAMEVALUELIST              
  @                              x                    1           
                                 y                    1 #         @                                 z                  #TNAMEVALUELIST_INIT%PRESENT {   #L |   #IGNOREDUPLICATES }                                              {     PRESENT           D                                 |     X               #TNAMEVALUELIST              
 @                               }           #         @                                 ~                   #L              D @                                    X               #TNAMEVALUELIST    #         @                                                    #L    #C              D                                      X               #TNAMEVALUELIST                                                           #         @                                                     #L    #I              D                                      X               #TNAMEVALUELIST              
                                             #         @                                                   #INI_NAMEVALUE_ADD%LEN_TRIM    #INI_NAMEVALUE_ADD%SCAN    #INI_NAMEVALUE_ADD%ADJUSTL    #INI_NAMEVALUE_ADD%TRIM    #INI_NAMEVALUE_ADD%LEN    #INI    #AINLINE                                                    LEN_TRIM                                                 SCAN                                                 ADJUSTL                                                 TRIM                                                 LEN           D @                                    ¸               #TINIFILE              
  @                                                  1 #         @                                                  #INI_OPEN_FILE%SCAN    #INI_OPEN_FILE%PRESENT    #INI_OPEN_FILE%ADJUSTL    #INI_OPEN_FILE%TRIM    #INI    #FILENAME    #UNIT_ID    #ERROR    #SLASH_COMMENTS    #APPEND                                                    SCAN                                                 PRESENT                                                 ADJUSTL                                                 TRIM           D @                                    ¸               #TINIFILE              
  @                                                  1           
  @                                                    D @                                                     
 @                                                    
 @                                          $         @                                                          #INI_EXTRACTFILEPATH%LEN_TRIM    #ANAME                                                            LEN_TRIM           
  @                                                  1 #         @                                                     #INI    #LINES    #NUMLINES    #SLASH_COMMENTS               D @                                    ¸               #TINIFILE    ,         
  @                                                       p          5  p        r        5  p        r                      1           
                                                       
                                              #         @                                  ¡                                 fn#fn    ¾          gen@READ_PRM    G  ²       gen@SET_PRM    ù  @       INLINE !   9  s       INI_MAX_NAME_LEN #   ¬  t       INI_MAX_STRING_LEN       e       TNAMEVALUE       P   a   TNAMEVALUE%NAME !   Õ  P   a   TNAMEVALUE%VALUE #   %  W       TNAMEVALUE_POINTER %   |  `   a   TNAMEVALUE_POINTER%P    Ü         TNAMEVALUELIST %   q  H   a   TNAMEVALUELIST%COUNT %   ¹  H   a   TNAMEVALUELIST%DELTA (     H   a   TNAMEVALUELIST%CAPACITY 0   I  H   a   TNAMEVALUELIST%IGNOREDUPLICATES %     ¬   a   TNAMEVALUELIST%ITEMS    =  z       TINIFILE '   ·  H   a   TINIFILE%SLASHCOMMENTS    ÿ  d   a   TINIFILE%L $   c  d   a   TINIFILE%READVALUES    Ç  N       DEFINI    	         READ_PRM_INT %   ¦	  @      READ_PRM_INT%ADJUSTL "   æ	  =      READ_PRM_INT%TRIM $   #
  L   a   READ_PRM_INT%STRING $   o
     a   READ_PRM_INT%PARAMS    û
         READ_PRM_DBL %     @      READ_PRM_DBL%ADJUSTL "   Ì  =      READ_PRM_DBL%TRIM $   	  L   a   READ_PRM_DBL%STRING $   U     a   READ_PRM_DBL%PARAMS    á         READ_PRM_REAL &   t  @      READ_PRM_REAL%ADJUSTL #   ´  =      READ_PRM_REAL%TRIM %   ñ  L   a   READ_PRM_REAL%STRING %   =     a   READ_PRM_REAL%PARAMS    É         READ_PRM_LOG %   Z  @      READ_PRM_LOG%ADJUSTL "     =      READ_PRM_LOG%TRIM $   ×  L   a   READ_PRM_LOG%STRING $   #     a   READ_PRM_LOG%PARAMS "   ¯  ~       SET_PRM_ARRAY_INT '   -  =      SET_PRM_ARRAY_INT%TRIM '   j  L   a   SET_PRM_ARRAY_INT%ARGS $   ¶     a   SET_PRM_ARRAY_INT%P &   B     a   SET_PRM_ARRAY_INT%DEF "   Î  ~       SET_PRM_ARRAY_DBL '   L  =      SET_PRM_ARRAY_DBL%TRIM '     L   a   SET_PRM_ARRAY_DBL%ARGS $   Õ     a   SET_PRM_ARRAY_DBL%P &   a     a   SET_PRM_ARRAY_DBL%DEF    í  x       SET_PRM_INT !   e  =      SET_PRM_INT%TRIM !   ¢  L   a   SET_PRM_INT%ARGS    î  @   a   SET_PRM_INT%P     .  @   a   SET_PRM_INT%DEF    n  x       SET_PRM_DBL !   æ  =      SET_PRM_DBL%TRIM !   #  L   a   SET_PRM_DBL%ARGS    o  @   a   SET_PRM_DBL%P     ¯  @   a   SET_PRM_DBL%DEF    ï  x       SET_PRM_STR !   g  =      SET_PRM_STR%TRIM !   ¤  L   a   SET_PRM_STR%ARGS    ð  L   a   SET_PRM_STR%P     <  L   a   SET_PRM_STR%DEF      x       SET_PRM_LOG !      =      SET_PRM_LOG%TRIM !   =  L   a   SET_PRM_LOG%ARGS      @   a   SET_PRM_LOG%P     É  @   a   SET_PRM_LOG%DEF     	         SET_PARAMS_FILE 7   §  O      SET_PARAMS_FILE%COMMAND_ARGUMENT_COUNT    ö  «       INI_OPEN !   ¡  @      INI_OPEN%PRESENT    á  =      INI_OPEN%TRIM "     L   a   INI_OPEN%FILENAME !   j  @   a   INI_OPEN%UNIT_ID    ª  @   a   INI_OPEN%ERROR (   ê  @   a   INI_OPEN%SLASH_COMMENTS    *  a       READ_STR      L   a   READ_STR%KEY %   ×  j       INI_READ_STRING_FILE )   A  V   a   INI_READ_STRING_FILE%INI )     L   a   INI_READ_STRING_FILE%KEY    ã  Y       READ_INT    <   L   a   READ_INT%KEY "             INI_READ_INT_FILE )   $!  ?      INI_READ_INT_FILE%VERIFY '   c!  =      INI_READ_INT_FILE%TRIM &    !  V   a   INI_READ_INT_FILE%INI &   ö!  L   a   INI_READ_INT_FILE%KEY    B"  Y       READ_REAL    "  L   a   READ_REAL%KEY #   ç"  b       INI_READ_REAL_FILE '   I#  V   a   INI_READ_REAL_FILE%INI '   #  L   a   INI_READ_REAL_FILE%KEY    ë#  Y       READ_LOG    D$  L   a   READ_LOG%KEY "   $         INI_READ_LOG_FILE )   ,%  ?      INI_READ_LOG_FILE%VERIFY '   k%  =      INI_READ_LOG_FILE%TRIM &   ¨%  V   a   INI_READ_LOG_FILE%INI &   þ%  L   a   INI_READ_LOG_FILE%KEY    J&  Y       READ_DBL    £&  L   a   READ_DBL%KEY "   ï&  b       INI_READ_DBL_FILE &   Q'  V   a   INI_READ_DBL_FILE%INI &   §'  L   a   INI_READ_DBL_FILE%KEY    ó'  Y       READ_VAL    L(  L   a   READ_VAL%KEY &   (  b       TNAMEVALUELIST_HASKEY (   ú(  \   a   TNAMEVALUELIST_HASKEY%L ,   V)  L   a   TNAMEVALUELIST_HASKEY%ANAME '   ¢)  f       TNAMEVALUELIST_VALUEOF )   *  \   a   TNAMEVALUELIST_VALUEOF%L -   d*  L   a   TNAMEVALUELIST_VALUEOF%ANAME .   °*  L   a   TNAMEVALUELIST_VALUEOF%AVALUE #   ü*         TNAMEVALUELIST_ADD (   +  =      TNAMEVALUELIST_ADD%TRIM %   ¼+  \   a   TNAMEVALUELIST_ADD%L )   ,  L   a   TNAMEVALUELIST_ADD%ANAME *   d,  L   a   TNAMEVALUELIST_ADD%AVALUE $   °,         TNAMEVALUELIST_INIT ,   6-  @      TNAMEVALUELIST_INIT%PRESENT &   v-  \   a   TNAMEVALUELIST_INIT%L 5   Ò-  @   a   TNAMEVALUELIST_INIT%IGNOREDUPLICATES %   .  O       TNAMEVALUELIST_CLEAR '   a.  \   a   TNAMEVALUELIST_CLEAR%L +   ½.  V       TNAMEVALUELIST_SETCAPACITY -   /  \   a   TNAMEVALUELIST_SETCAPACITY%L -   o/  @   a   TNAMEVALUELIST_SETCAPACITY%C &   ¯/  V       TNAMEVALUELIST_DELETE (   0  \   a   TNAMEVALUELIST_DELETE%L (   a0  @   a   TNAMEVALUELIST_DELETE%I "   ¡0  ð       INI_NAMEVALUE_ADD +   1  A      INI_NAMEVALUE_ADD%LEN_TRIM '   Ò1  =      INI_NAMEVALUE_ADD%SCAN *   2  @      INI_NAMEVALUE_ADD%ADJUSTL '   O2  =      INI_NAMEVALUE_ADD%TRIM &   2  <      INI_NAMEVALUE_ADD%LEN &   È2  V   a   INI_NAMEVALUE_ADD%INI *   3  L   a   INI_NAMEVALUE_ADD%AINLINE    j3  ý       INI_OPEN_FILE #   g4  =      INI_OPEN_FILE%SCAN &   ¤4  @      INI_OPEN_FILE%PRESENT &   ä4  @      INI_OPEN_FILE%ADJUSTL #   $5  =      INI_OPEN_FILE%TRIM "   a5  V   a   INI_OPEN_FILE%INI '   ·5  L   a   INI_OPEN_FILE%FILENAME &   6  @   a   INI_OPEN_FILE%UNIT_ID $   C6  @   a   INI_OPEN_FILE%ERROR -   6  @   a   INI_OPEN_FILE%SLASH_COMMENTS %   Ã6  @   a   INI_OPEN_FILE%APPEND $   7         INI_EXTRACTFILEPATH -   7  A      INI_EXTRACTFILEPATH%LEN_TRIM *   É7  L   a   INI_EXTRACTFILEPATH%ANAME #   8  ~       INI_OPEN_FROMLINES '   8  V   a   INI_OPEN_FROMLINES%INI )   é8  ¸   a   INI_OPEN_FROMLINES%LINES ,   ¡9  @   a   INI_OPEN_FROMLINES%NUMLINES 2   á9  @   a   INI_OPEN_FROMLINES%SLASH_COMMENTS    !:  H       INI_CLOSE 