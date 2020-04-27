subroutine Kernels_tau(rL,eL,WA,WB,X,kernel,gln,gle)
!Kernels of lensing reconstruction noise
  implicit none
  !I/O
  character(*), intent(in) :: kernel
  integer, intent(in) :: rL(1:2), eL(1:2)
  integer, intent(in), optional :: gln
  double precision, intent(in), optional :: gle
  double precision, intent(in), dimension(rL(1):rL(2)) :: WA, WB
  double precision, intent(out) :: X(:)
  !internal
  type(gauss_legendre_params) :: GL
  character(LEN=4) :: selec
  integer :: i, l, gn
  double precision :: pm, mu, Ip, Im, al, c1_inv, c3, ge
  double precision, dimension(2) :: d00_sup, d00_mid, d00_inf
  double precision, dimension(2) :: ZA00
  double precision, dimension(2) :: ZB00

  X = 0d0

  !* GL quadrature
  gn = int((3*max(rL(2),eL(2))+1)/2)
  ge = 1d-15
  if (present(gln)) gn = gln
  if (present(gle)) ge = gle
  call gl_initialize(GL,gln,gle)

  do i = 1, GL%n !Gauss-Legendre Integration
    mu = GL%z(i)
    select case(selec)
    case ('S0')
      call ZETA(0,0,rL,WA,mu,ZA00)
      call ZETA(0,0,rL,WB,mu,ZB00)
      Ip = ZA00(1)*ZB00(1)
    case ('G0') !same as S0
      call ZETA(0,0,rL,WA,mu,ZA00)
      call ZETA(0,0,rL,WB,mu,ZB00)
      Ip = ZA00(1)*ZB00(1)
    case default
      stop 'error: no kernel'
    end select
    do l = 1, eL(2) ! loop for l
      al = dble(l)
      if(l==1) then 
        d00_sup = wigd_ini(0,0,mu)
        d00_inf = d00_mid
        d00_mid = d00_sup
        d00_sup(1:2) = mu*d00_mid(1:2)*(al*(2d0*al-1d0))/al**2
      else
        c1_inv = (2d0*al-1d0)/al
        c3 = (al-1d0)**2/((al-1d0)*(2d0*al-1d0))
        d00_sup(1) = (mu*d00_mid(1) - c3*d00_inf(1))*c1_inv
        d00_sup(2) = (mu*d00_mid(2) - c3*d00_inf(2))*c1_inv
      end if
      X(l) = X(l) + Ip*d00_sup(1)*GL%w(i)*2d0*pi
      d00_inf = d00_mid
      d00_mid = d00_sup
    end do
  end do

  call gl_finalize(GL)

end subroutine Kernels_tau


subroutine AlTT_tau(rL,eL,Att,fC,OCTT,ITT,gln,gle)
  implicit none
  !I/O
  integer, intent(in) :: rL(2), eL(2)
  integer, intent(in), optional :: gln
  double precision, intent(in), optional :: gle
  double precision, intent(in), dimension(:) :: fC
  double precision, intent(in), dimension(:), optional :: OCTT, ITT
  double precision, intent(out), dimension(:) :: Att
  !internal
  integer :: gn, oL(2)
  double precision :: ge
  double precision, dimension(rL(1):rL(2)) :: W1, W2
  double precision, dimension(min(2*rL(2),eL(2))) :: S0, G0

  write(*,*) 'TT'

  if (eL(1)<1)  stop 'error (altt_tau): lmin<1'

  !only compute nonzero values
  oL = [eL(1),min(2*rL(2),eL(2))]

  !accuracy for GL
  gn = int((3*max(rL(2),oL(2))+1)/2)
  ge = 1d-15
  if (present(gln)) gn = gln
  if (present(gle)) ge = gle

  !filtering functions
  if (present(OCTT)) W1 = 1d0 / OCTT(rL(1):rL(2))
  if (present(ITT))  W1 = ITT(rL(1):rL(2))
  if (.not.present(OCTT).and..not.present(ITT)) stop 'need OCTT or ITT'

  !main calculation
  W2 = W1 * fC(rL(1):rL(2))**2
  S0 = 0d0
  call Kernels_tau(rL,oL,W1,W2,S0,'S0',gn,ge)

  W2 = W1 * fC(rL(1):rL(2))
  G0 = 0d0
  call Kernels_tau(rL,oL,W2,W2,G0,'G0',gn,ge)

  Att = 0d0
  Att(oL(1):oL(2)) = 1d0/(S0(oL(1):oL(2))+G0(oL(1):oL(2)))

end subroutine AlTT_tau

