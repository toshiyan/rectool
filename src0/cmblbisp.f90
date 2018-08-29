!////////////////////////////////////////////////////////////////!
! * CMB lensing bispectrum subroutines for analytic calculation
!////////////////////////////////////////////////////////////////!

module cmblbisp
  use myconst, only: pi
  use myutils, only: neighb, spline, savetxt
  use myfunc,  only: C_z, H_z, D_z, NonLinRatios, pk2sigma, cosmoparams
  implicit none

  private pi
  private neighb, spline, savetxt
  private C_z, H_z, D_z, NonLinRatios, pk2sigma, cosmoparams

contains


subroutine prep_lens_bispectrum(z,dz,zs,cp,ki,pklin0,model,kl,pl,zker,abc,wp,ck,btype,pkout,knl)
! compute k and Pk at k=l/chi, factor (fac) for LSS bispectrum, F2-kernel coefficients (abc), 
! weighted potential spectrum (wp), and kappa spectrum at [chi,chi_s] (ck)
  implicit none

  ![input]
  ! model  --- nonlinear matter bispectrum fitting model ('TR' for tree level)
  ! z, dz  --- redshift points and thier interval
  ! zs     --- source z
  ! cp     --- cosmological parameters
  ! ki     --- CAMB output k
  ! pklin0 --- CAMB output P(k,z=0)
  type(cosmoparams), intent(in) :: cp
  character(*), intent(in) :: model
  double precision, intent(in)  :: z(:), dz(:), zs, ki(:), pklin0(:)

  !(optional)
  ! btype  --- type of bispectrum (kkk,gkk,ggk)
  ! pkout  --- output Pk data
  character(*), intent(in), optional :: btype
  integer, optional :: pkout
  double precision, optional :: knl(:)

  ![output]
  ! kl, pl --- k and Pk at k=l/chi
  ! knl    --- nonlinear k at each z
  ! zker   --- z factor for LSS bispectrum
  ! abc    --- F2-kernel coefficients
  ! wp     --- weighted potential power spectrum
  ! ck     --- kappa power spectrum at [chi,chis_s]
  double precision, intent(out) :: kl(:,:), pl(:,:), zker(:), abc(:,:,:), wp(:,:), ck(:,:)

  !internal
  character(4) :: bisptype
  integer :: i, zn, kn
  double precision :: s0, chis, h
  double precision, allocatable :: Hz(:), chi(:), D(:), wlf(:), pki(:,:), pklini(:,:)

  zn = size(z)  !number of z points for z-integral
  kn = size(ki) !number of CAMB output k

  if (model/='TR'.and.model/='SC'.and.model/='GM') stop 'error (prep_lens_bispectrum): your model is not supported'

  !* get distances and lensing weights
  allocate(Hz(zn),chi(zn),D(zn),wlf(zn),pklini(zn,kn),pki(zn,kn))
  D    = D_z(z,cp)  !growth factor
  chis = C_z(zs,cp) !source comoving distance
  chi  = C_z(z,cp)  !comoving distance at each z
  Hz   = H_z(z,cp)  !expansion rate at z
  h    = cp%H0/100d0

  wlf  = 1.5d0*cp%Om*(cp%H0/3d5)**2*(1d0+z) !matter -> potential conversion factor (matter dominant)

  ! check errors
  if (2d0/chi(zn)<ki(1)) write(*,*) 'warning: required minimum k is smaller than input', 2d0/chi(zn), ki(1)
  if (chis<maxval(chi)) stop 'chis is smaller than maximum of chi in the chi integral'

  ! choose kernel for z integral
  bisptype = 'kkk'
  if (present(btype)) bisptype = btype
  select case (bisptype)
  case ('kkk')
    zker = dz/Hz * (wlf*(chis-chi)*chi/chis)**3 * 2d0/chi**4 
  case ('gkk')
    zker = dz/Hz * (wlf*(chis-chi)*chi/chis)**2 * 2d0/chi**4 * Hz
  case ('ggk')
    zker = dz/Hz * (wlf*(chis-chi)*chi/chis) * 2d0/chi**4 * Hz**2
  case default
    stop 'need z-kernel type'
  end select

  !* get linear and non-linear Pk at each z
  do i = 1, zn
    pklini(i,:) = D(i)**2*pklin0  !linear P(k,z) (i=1 -> z=0)
  end do

  !* get knl
  if (present(knl)) call get_knl(ki,pklini,knl)

  if (model=='TR')  pki = pklini  !use linear 
  if (model/='TR')  call NonLinRatios(pklini,z,ki,cp,pki) !nonlinear Pk

  if (present(pkout)) then
    call savetxt('pklin.dat',ki/h,pklini(pkout,:)*h**3,ow=.true.)
    call savetxt('pk.dat',ki/h,pki(pkout,:)*h**3,ow=.true.)
  end if

  !* sigma_8
  s0 = dsqrt(pk2sigma(8d0/h,ki,pklini(1,:)))
  write(*,*) 'sigma8 = ', s0
  !do i = 1, zn
  !  wlf(i) = dsqrt(pk2sigma(8d0/h,ki,pklini(i,:)))
  !end do
  !call savetxt('sigmaz.dat',z,wlf)

  !* interpolate k, Pk at k=l/chi
  call Limber_k2l(chi,ki,pki,kl,pl)  

  !* precompute F2-kernel coefficients a, b, c 
  if (model/='TR')  call precompute_coeff_abc(D*s0,kl,ki,pklini,abc,model)

  !* precompute for post born
  call precompute_postborn(dz/Hz,chi,chis,wlf,kl,pl,wp,ck)

  deallocate(Hz,chi,D,wlf,pklini,pki)

end subroutine prep_lens_bispectrum


subroutine prep_lens_aps(z,dz,zs,cp,ki,pklin0,ck)
  implicit none

  ![input]
  ! z, dz  --- redshift points and thier interval
  ! zs     --- source z
  ! cp     --- cosmological parameters
  ! ki     --- CAMB output k
  ! pklin0 --- CAMB output P(k,z=0)
  type(cosmoparams), intent(in) :: cp
  double precision, intent(in)  :: z(:), dz(:), zs, ki(:), pklin0(:)

  ![output]
  ! ck     --- kappa power spectrum at chis_s
  double precision, intent(out) :: ck(:)

  !internal
  integer :: i, zn, kn, ln, l
  double precision :: chis, h
  double precision, allocatable :: Hz(:), chi(:), D(:), wlf(:), pki(:,:), pklini(:,:), pl(:,:), kl(:,:)

  zn = size(z)  !number of z points for z-integral
  kn = size(ki) !number of CAMB output k
  ln = size(ck)

  !* get distances and lensing weights
  allocate(Hz(zn),chi(zn),D(zn),wlf(zn),pklini(zn,kn),pki(zn,kn))
  D    = D_z(z,cp)  !growth factor
  chis = C_z(zs,cp) !source comoving distance
  chi  = C_z(z,cp)  !comoving distance at each z
  Hz   = H_z(z,cp)  !expansion rate at z
  h    = cp%H0/100d0

  wlf  = 1.5d0*cp%Om*(cp%H0/3d5)**2*(1d0+z) !matter -> potential conversion factor (matter dominant)

  if (2d0/chi(zn)<ki(1)) write(*,*) 'warning: required minimum k is smaller than input', 2d0/chi(zn), ki(1)
  if (chis<maxval(chi)) stop 'chis is smaller than maximum of chi in the chi integral'

  !* get linear and non-linear Pk at each z
  do i = 1, zn
    pklini(i,:) = D(i)**2*pklin0  !linear P(k,z) (i=1 -> z=0)
  end do
  call NonLinRatios(pklini,z,ki,cp,pki) !nonlinear Pk

  ! check nonlinear Pk
  !call savetxt('Pklin.dat',ki/h,pklini(1,:)*h**3,pklini(zn,:)*h**3,ow=.true.)
  !call savetxt('Pk.dat',ki/h,pki(1,:)*h**3,pki(zn,:)*h**3,ow=.true.)

  !* interpolate k, Pk at k=l/chi
  allocate(kl(zn,ln),pl(zn,ln))
  call Limber_k2l(chi,ki,pki,kl,pl)  

  !* kappa aps
  ck = 0d0
  do l = 2, ln
    ck(l) = sum(pl(:,l)*(dz/Hz)*(wlf*(chis-chi)*chi/chis)**2/chi**2)
  end do

  deallocate(Hz,chi,D,wlf,pklini,pki,pl,kl)

end subroutine prep_lens_aps


subroutine Limber_k2l(chi,k,Pk,kl,Pl)
! get k and P(k) at k=l/chi
  implicit none
  double precision, intent(in) :: chi(:), k(:), Pk(:,:)
  double precision, intent(out) :: kl(:,:), Pl(:,:)
  integer :: i, l, zn, kn, ln, id
  double precision :: kk
  !double precision, allocatable :: y2a(:)

  zn = size(Pk,dim=1) !num of z points
  kn = size(Pk,dim=2) !num of k points
  ln = size(kl,dim=2) !num of multipole

  do i = 1, zn
    !allocate(y2a(kn))
    !call spline(k,Pk(i,:),kn,0d0,0d0,y2a)
    do l = 1, ln
      kk = dble(l)/chi(i)
      id = neighb(kk,k) !look for neighberest points
      kl(i,l) = kk
      !* linear interpolation
      Pl(i,l) = Pk(i,id) + (Pk(i,id+1)-Pk(i,id))*(kk-k(id))/(k(id+1)-k(id))
      !Pl(i,l) = splint(kk,k(i),Pk(i,:),y2a)
    end do
    !deallocate(y2a)
  end do

end subroutine Limber_k2l


function W3j_approx(l1,l2,l3) result(f)
! approximate W3j symbol
  implicit none
  double precision, intent(in) :: l1,l2,l3
  double precision :: a1,a2,a3,b,f,Lh

  if (mod(int(l1+l2+l3),2)/=0) then 
    f = 0d0
  else
    Lh = dble(l1+l2+l3)*0.5d0
    a1 = ((Lh-l1+0.5d0)/(Lh-l1+1d0))**(Lh-l1+0.25d0)
    a2 = ((Lh-l2+0.5d0)/(Lh-l2+1d0))**(Lh-l2+0.25d0)
    a3 = ((Lh-l3+0.5d0)/(Lh-l3+1d0))**(Lh-l3+0.25d0)
    b = 1d0/((Lh-l1+1d0)*(Lh-l2+1d0)*(Lh-l3+1d0))**(0.25d0)
    f = (-1d0)**Lh/dsqrt(2d0*pi) * exp(1.5d0)* (Lh+1d0)**(-0.25d0) * a1*a2*a3*b
  end if

end function W3j_approx


subroutine F2_Kernel(k,p1,p2,F2K,lambda,kappa)
! F2 kernel
  implicit none
  double precision, intent(in) :: k(3), p1(3), p2(3)
  double precision, intent(out) :: F2K
  double precision, intent(in), optional :: lambda,kappa
  !internal
  double precision :: cost, lam, kap

  lam = 1d0; kap=1d0
  if (present(lambda)) lam=lambda
  if (present(kappa))  kap=kappa

  cost = (k(3)**2-k(1)**2-k(2)**2)/(2d0*k(1)*k(2)) !cos(theta) of vectors k1 and k2
  F2K = (kap-lam*2d0/7d0)*p1(1)*p2(1) + kap*(k(1)**2+k(2)**2)/(2d0*k(1)*k(2))*cost*p1(2)*p2(2) + lam*2d0/7d0*cost**2*p1(3)*p2(3)

end subroutine F2_Kernel


subroutine bisp_equi(eL,k,Pk,fac,abc,wp,ck,bl,btype,ltype,lambda,kappa)
! equilateral bispectrum
  implicit none
  !I/O
  character(*), intent(in), optional :: btype, ltype
  integer, intent(in) :: eL(2)
  double precision, intent(in) :: k(:,:), Pk(:,:), fac(:), abc(:,:,:), wp(:,:), ck(:,:)
  double precision, intent(out) :: bl(:)
  double precision, intent(in), optional :: lambda(:), kappa(:)
  !internal
  character(8) :: b='', lt=''
  integer :: l, i, zn
  double precision :: bisp, F2
  double precision, allocatable :: lam(:), kap(:)

  zn = size(k,dim=1)
  if (present(btype)) b  = btype
  if (present(ltype)) lt = ltype

  ! MG parameters
  allocate(lam(zn),kap(zn)); lam=1d0; kap=1d0
  if (present(lambda))  lam = lambda
  if (present(kappa))   kap = kappa

  do l = eL(1), eL(2)
    bisp = 0d0
    if (b=='pb')  bisp = 3d0*dble(l)**4*sum(wp(:,l)*ck(:,l))
    if (b=='LSS') then 
      do i = 1, zn
        call F2_Kernel([k(i,l),k(i,l),k(i,l)],abc(:,i,l),abc(:,i,l),F2,lam(i),kap(i))
        bisp = bisp + fac(i) * 3d0 * F2*Pk(i,l)*Pk(i,l)
      end do
    end if
    if (lt=='full') bisp = bisp * W3j_approx(dble(l),dble(l),dble(l)) * dsqrt((2d0*l+1d0)**3/(4d0*pi))
    bl(l) = bisp
  end do

  deallocate(lam,kap)

end subroutine bisp_equi


subroutine bisp_fold(eL,k,Pk,fac,abc,wp,ck,bl,btype,ltype,lambda,kappa)
! folded bispectrum
  implicit none
  !I/O
  character(*), intent(in), optional :: btype, ltype
  integer, intent(in) :: eL(2)
  double precision, intent(in) :: k(:,:), Pk(:,:), fac(:), abc(:,:,:), wp(:,:), ck(:,:)
  double precision, intent(out) :: bl(:)
  double precision, intent(in), optional :: lambda(:), kappa(:)
  !internal
  character(8) :: b='', lt=''
  integer :: l, i, zn
  double precision :: bisp, F2(3)
  double precision, allocatable :: lam(:), kap(:)

  zn = size(k,dim=1)
  if (present(btype)) b  = btype
  if (present(ltype)) lt = ltype

  allocate(lam(zn),kap(zn)); lam=1d0; kap=1d0
  if (present(lambda))  lam = lambda
  if (present(kappa))   kap = kappa

  do l = eL(1), eL(2)
    bisp = 0d0
    if (b=='pb')  bisp = - 8d0*dble(l)**4*sum(wp(:,l)*ck(:,l)) - 4d0*(dble(l)**4*sum(wp(:,l)*ck(:,2*l))-dble(2*l)**4*sum(wp(:,2*l)*ck(:,l)))
    if (b=='LSS') then 
      do i = 1, zn
        call F2_Kernel([k(i,l),k(i,l),k(i,2*l)],abc(:,i,l),abc(:,i,l),F2(1),lam(i),kap(i))
        call F2_Kernel([k(i,l),k(i,2*l),k(i,l)],abc(:,i,l),abc(:,i,2*l),F2(2),lam(i),kap(i))
        call F2_Kernel([k(i,2*l),k(i,l),k(i,l)],abc(:,i,2*l),abc(:,i,l),F2(3),lam(i),kap(i))
        bisp = bisp + fac(i) * (F2(1)*Pk(i,l)*Pk(i,l) + F2(2)*Pk(i,l)*Pk(i,2*l) + F2(3)*Pk(i,2*l)*Pk(i,l))
      end do
    end if
    if (lt=='full') bisp = bisp * W3j_approx(dble(l),dble(l),dble(2*l)) * dsqrt((2d0*l+1d0)**2*(4d0*l+1)/(4d0*pi))
    bl(2*l) = bisp
  end do

  deallocate(lam,kap)

end subroutine bisp_fold


subroutine bisp_sque(eL,k,Pk,fac,abc,wp,ck,l0,bl,btype,ltype,lambda,kappa)
! squeezed bispectrum
  implicit none
  !I/O
  character(*), intent(in), optional :: btype, ltype
  integer, intent(in) :: eL(2), l0
  double precision, intent(in) :: k(:,:), Pk(:,:), fac(:), abc(:,:,:), wp(:,:), ck(:,:)
  double precision, intent(out) :: bl(:)
  double precision, intent(in), optional :: lambda(:), kappa(:)
  !internal
  character(8) :: b='', lt=''
  integer :: l, i, zn
  double precision :: bisp, F2(3)
  double precision, allocatable :: lam(:), kap(:)

  zn = size(k,dim=1)
  if (present(btype)) b  = btype
  if (present(ltype)) lt = ltype

  allocate(lam(zn),kap(zn)); lam=1d0; kap=1d0
  if (present(lambda))  lam = lambda
  if (present(kappa))   kap = kappa

  !do l = max(l0,eL(1)), eL(2)
  bl = 0d0
  do l = eL(1), eL(2)
    if (2*l<l0) cycle
    bisp = 0d0
    if (b=='pb') call bisp_postborn(l0,l,l,wp,ck,bisp)
    if (b=='LSS') then
      do i = 1, zn
        call F2_Kernel([k(i,l),k(i,l),k(i,l0)],abc(:,i,l),abc(:,i,l),F2(1),lam(i),kap(i))
        call F2_Kernel([k(i,l),k(i,l0),k(i,l)],abc(:,i,l),abc(:,i,l0),F2(2),lam(i),kap(i))
        call F2_Kernel([k(i,l0),k(i,l),k(i,l)],abc(:,i,l0),abc(:,i,l),F2(3),lam(i),kap(i))
        bisp = bisp + fac(i) * (F2(1)*Pk(i,l)*Pk(i,l) + F2(2)*Pk(i,l)*Pk(i,l0) + F2(3)*Pk(i,l0)*Pk(i,l))
      end do
    end if
    if (lt=='full') bisp = bisp * W3j_approx(dble(l),dble(l),dble(l0)) * dsqrt((2d0*l+1d0)**2*(2d0*l0+1)/(4d0*pi))
    bl(l) = bisp
  end do

  deallocate(lam,kap)

end subroutine bisp_sque


subroutine bisp_angl(eL,k,Pk,fac,abc,wp,ck,bl,btype,ltype,lambda,kappa)
! squeezed bispectrum
  implicit none
  !I/O
  character(*), intent(in), optional :: btype, ltype
  integer, intent(in) :: eL(2)
  double precision, intent(in) :: k(:,:), Pk(:,:), fac(:), abc(:,:,:), wp(:,:), ck(:,:)
  double precision, intent(out) :: bl(:)
  double precision, intent(in), optional :: lambda(:), kappa(:)
  !internal
  character(8) :: b='', lt=''
  integer :: l, i, zn, lc
  double precision :: bisp, F2(3)
  double precision, allocatable :: lam(:), kap(:)

  zn = size(k,dim=1)
  if (present(btype)) b  = btype
  if (present(ltype)) lt = ltype

  allocate(lam(zn),kap(zn)); lam=1d0; kap=1d0
  if (present(lambda))  lam = lambda
  if (present(kappa))   kap = kappa

  bl = 0d0
  lc = int(eL(2)/2)
  do l = eL(1), eL(2)
    bisp = 0d0
    if (b=='pb') call bisp_postborn(l,lc,lc,wp,ck,bisp)
    if (b=='LSS') then
      do i = 1, zn
        call F2_Kernel([k(i,l),k(i,lc),k(i,lc)],abc(:,i,l),abc(:,i,lc),F2(1),lam(i),kap(i))
        call F2_Kernel([k(i,lc),k(i,l),k(i,lc)],abc(:,i,lc),abc(:,i,l),F2(2),lam(i),kap(i))
        call F2_Kernel([k(i,lc),k(i,lc),k(i,l)],abc(:,i,lc),abc(:,i,lc),F2(3),lam(i),kap(i))
        bisp = bisp + fac(i) * (F2(1)*Pk(i,l)*Pk(i,lc) + F2(2)*Pk(i,lc)*Pk(i,l) + F2(3)*Pk(i,lc)*Pk(i,lc))
      end do
    end if
    if (lt=='full') bisp = bisp * W3j_approx(dble(l),dble(lc),dble(lc)) * dsqrt((2d0*l+1d0)*(2d0*lc+1)**2/(4d0*pi))
    bl(l) = bisp
  end do

  deallocate(lam,kap)

end subroutine bisp_angl


subroutine bisp_postborn(l1,l2,l3,wp,ck,bisp)
! compute bispectrum from post-Born correction
  implicit none
  !I/O
  integer, intent(in) :: l1, l2, l3
  double precision, intent(in) :: wp(:,:), ck(:,:)
  double precision, intent(out) :: bisp
  !internal
  double precision :: al1, al2, al3, l1l2, l2l3, l3l1
  
  al1  = dble(l1)
  al2  = dble(l2)
  al3  = dble(l3)
  l1l2 = al3**2-al1**2-al2**2 ! 2L1*L2
  l2l3 = al1**2-al2**2-al3**2
  l3l1 = al2**2-al3**2-al1**2

  !Post-Born correction: Eq.(4.4) of PL16
  !wPp = dchi * W^2(chi,chi_s)/chi^2 * P_psi 
  bisp =        l1l2/(2d0*al1**2*al2**2)*(l3l1*al1**4*sum(wp(:,l1)*ck(:,l2))+l2l3*al2**4*sum(wp(:,l2)*ck(:,l1)))
  bisp = bisp + l2l3/(2d0*al2**2*al3**2)*(l1l2*al2**4*sum(wp(:,l2)*ck(:,l3))+l3l1*al3**4*sum(wp(:,l3)*ck(:,l2)))
  bisp = bisp + l3l1/(2d0*al3**2*al1**2)*(l2l3*al3**4*sum(wp(:,l3)*ck(:,l1))+l1l2*al1**4*sum(wp(:,l1)*ck(:,l3)))

end subroutine bisp_postborn


function rebisp_fbin(eL1,eL2,eL3,zn,k,Pk,fac,abc,wp,ck,btype)  result(f)
! reduced bispectrum with flat binning
  implicit none
  character(*), intent(in) :: btype
  integer, intent(in) :: eL1(2), eL2(2), eL3(2), zn
  double precision, intent(in) :: k(:,:), Pk(:,:), fac(:), abc(:,:,:), wp(:,:), ck(:,:)
  integer :: l1, l2, l3, i
  double precision :: f, norm, bisp, hlll, tot, F2(1:3)

  tot  = 0d0
  norm = 0d0
  do l1 = eL1(1), eL1(2)
    do l2 = eL2(1), eL2(2)
      do l3 = eL3(1), eL3(2)
        if (l3>l1+l2.or.l3<abs(l1-l2)) cycle
        if (l1>l2+l3.or.l1<abs(l2-l3)) cycle
        if (l2>l3+l1.or.l2<abs(l3-l1)) cycle
        bisp = 0d0
        !compute F2 kernel at each z, and take sum
        if (btype=='LSS') then
          do i = 1, zn
            call F2_Kernel([k(i,l1),k(i,l2),k(i,l3)],abc(:,i,l1),abc(:,i,l2),F2(1))
            call F2_Kernel([k(i,l2),k(i,l3),k(i,l1)],abc(:,i,l2),abc(:,i,l3),F2(2))
            call F2_Kernel([k(i,l3),k(i,l1),k(i,l2)],abc(:,i,l3),abc(:,i,l1),F2(3))
            bisp = bisp + fac(i) * (F2(1)*Pk(i,l1)*Pk(i,l2) + F2(2)*Pk(i,l2)*Pk(i,l3) + F2(3)*Pk(i,l3)*Pk(i,l1))
          end do
        end if
        if (btype=='pb') call bisp_postborn(l1,l2,l3,wp,ck,bisp)
        !normalization
        hlll = W3j_approx(dble(l1),dble(l2),dble(l3)) * dsqrt((2d0*l1+1d0)*(2d0*l2+1d0)*(2d0*l3+1d0)/(4d0*pi))
        norm = norm + hlll**2
        !binned bispectrum
        tot  = tot + bisp*hlll**2
      end do
    end do
  end do

  f = tot/norm
  !f = norm

end function rebisp_fbin


function rebisp_fbin_gauss(eL1,eL2,eL3,cl)  result(f)
! reduced bispectrum with flat binning (a=g+g^2)
  implicit none
  integer, intent(in) :: eL1(2), eL2(2), eL3(2)
  double precision, intent(in) :: cl(:)
  integer :: l1, l2, l3
  double precision :: f, norm, bisp, hlll, tot

  tot  = 0d0
  norm = 0d0
  do l1 = eL1(1), eL1(2)
    do l2 = eL2(1), eL2(2)
      do l3 = eL3(1), eL3(2)
        if (l3>l1+l2.or.l3<abs(l1-l2)) cycle
        if (l1>l2+l3.or.l1<abs(l2-l3)) cycle
        if (l2>l3+l1.or.l2<abs(l3-l1)) cycle
        bisp = 2d0*(Cl(l1)*Cl(l2)+Cl(l2)*Cl(l3)+Cl(l3)*Cl(l1))
        !normalization
        hlll = W3j_approx(dble(l1),dble(l2),dble(l3)) * dsqrt((2d0*l1+1d0)*(2d0*l2+1d0)*(2d0*l3+1d0)/(4d0*pi))
        norm = norm + hlll**2
        !binned bispectrum
        tot  = tot + bisp*hlll**2
      end do
    end do
  end do

  f = tot/norm

end function rebisp_fbin_gauss


function snr_bisp(eL,zn,k,Pk,Cl,fac,abc,wp,ck)  result(f)
! SNR sum of LSS bispectrum
  implicit none
  integer, intent(in) :: eL(2), zn
  double precision, intent(in) :: k(:,:), Pk(:,:), Cl(:), fac(:), abc(:,:,:), wp(:,:), ck(:,:)
  integer :: l1, l2, l3, i
  double precision :: f, cov, Del, bisp(2), tot, F2(1:3)

  tot = 0d0
  do l1 = eL(1), eL(2)
    !write(*,*) l1
    do l2 = l1, eL(2)
      do l3 = l2, eL(2)
        if (l3>l1+l2.or.l3<abs(l1-l2)) cycle
        if (l1>l2+l3.or.l1<abs(l2-l3)) cycle
        if (l2>l3+l1.or.l2<abs(l3-l1)) cycle
        if (mod(l1+l2+l3,2)==1) cycle
        Del = 1d0
        if (l1==l2.and.l2/=l3) Del = 2d0
        if (l1/=l2.and.l2==l3) Del = 2d0
        if (l1==l2.and.l2==l3) Del = 6d0
        bisp = 0d0
        !compute F2 kernel at each z, and take sum
        do i = 1, zn
          call F2_Kernel([k(i,l1),k(i,l2),k(i,l3)],abc(:,i,l1),abc(:,i,l2),F2(1))
          call F2_Kernel([k(i,l2),k(i,l3),k(i,l1)],abc(:,i,l2),abc(:,i,l3),F2(2))
          call F2_Kernel([k(i,l3),k(i,l1),k(i,l2)],abc(:,i,l3),abc(:,i,l1),F2(3))
          bisp(1) = bisp(1) + fac(i) * (F2(1)*Pk(i,l1)*Pk(i,l2) + F2(2)*Pk(i,l2)*Pk(i,l3) + F2(3)*Pk(i,l3)*Pk(i,l1))
        end do
        call bisp_postborn(l1,l2,l3,wp,ck,bisp(2))
        !flat sky -> full sky
        bisp = bisp * W3j_approx(dble(l1),dble(l2),dble(l3)) * dsqrt((2d0*l1+1d0)*(2d0*l2+1d0)*(2d0*l3+1d0)/(4d0*pi))
        !SNR
        cov = Del*Cl(l1)*Cl(l2)*Cl(l3)
        tot = tot + sum(bisp)**2/cov
      end do
    end do
  end do

  f = tot

end function snr_bisp


function snr_bisp_assym(eL1,eL2,eL3,zn,k,Pk,Cl,fac,abc,wp,ck)  result(f)
! SNR sum of LSS bispectrum
  implicit none
  integer, intent(in) :: eL1(2), eL2(2), eL3(2), zn
  double precision, intent(in) :: k(:,:), Pk(:,:), Cl(:), fac(:), abc(:,:,:), wp(:,:), ck(:,:)
  integer :: l1, l2, l3, i
  double precision :: f, cov, bisp(2), tot, F2(1:3)

  tot = 0d0
  do l1 = eL1(1), eL1(2)
    !write(*,*) l1
    do l2 = eL2(1), eL2(2)
      do l3 = eL3(1), eL3(2)
        if (l3>l1+l2.or.l3<abs(l1-l2)) cycle
        if (l1>l2+l3.or.l1<abs(l2-l3)) cycle
        if (l2>l3+l1.or.l2<abs(l3-l1)) cycle
        if (mod(l1+l2+l3,2)==1) cycle
        bisp = 0d0
        !compute F2 kernel at each z, and take sum
        do i = 1, zn
          call F2_Kernel([k(i,l1),k(i,l2),k(i,l3)],abc(:,i,l1),abc(:,i,l2),F2(1))
          call F2_Kernel([k(i,l2),k(i,l3),k(i,l1)],abc(:,i,l2),abc(:,i,l3),F2(2))
          call F2_Kernel([k(i,l3),k(i,l1),k(i,l2)],abc(:,i,l3),abc(:,i,l1),F2(3))
          bisp(1) = bisp(1) + fac(i) * (F2(1)*Pk(i,l1)*Pk(i,l2) + F2(2)*Pk(i,l2)*Pk(i,l3) + F2(3)*Pk(i,l3)*Pk(i,l1))
        end do
        call bisp_postborn(l1,l2,l3,wp,ck,bisp(2))
        !flat sky -> full sky
        bisp = bisp * W3j_approx(dble(l1),dble(l2),dble(l3)) * dsqrt((2d0*l1+1d0)*(2d0*l2+1d0)*(2d0*l3+1d0)/(4d0*pi))
        !SNR
        cov = 6d0*Cl(l1)*Cl(l2)*Cl(l3)
        tot = tot + sum(bisp)**2/cov
      end do
    end do
  end do

  f = tot

end function snr_bisp_assym



function snr_xbisp(eL,zn,k,Pk,cgg,ckk,fac,abc,wp,ck,btype)  result(f)
! SNR sum of gkk or ggk bispectrum
  implicit none
  character(*), intent(in) :: btype
  integer, intent(in) :: eL(2), zn
  double precision, intent(in) :: k(:,:), Pk(:,:), cgg(:), ckk(:), fac(:), abc(:,:,:), wp(:,:), ck(:,:)
  integer :: l1, l2, l3, i
  double precision :: f, cov, Del, bisp, tot, F2(1:3)

  tot = 0d0
  do l1 = eL(1), eL(2)
    if (mod(l1,10)==0) write(*,*) l1
    do l2 = eL(1), eL(2)
      do l3 = l2, eL(2)
        if (l3>l1+l2.or.l3<abs(l1-l2)) cycle
        if (l1>l2+l3.or.l1<abs(l2-l3)) cycle
        if (l2>l3+l1.or.l2<abs(l3-l1)) cycle
        if (mod(l1+l2+l3,2)==1) cycle
        Del = 3d0
        if (l2==l3) Del = 6d0
        bisp = 0d0
        !compute F2 kernel at each z, and take sum
        do i = 1, zn
          call F2_Kernel([k(i,l1),k(i,l2),k(i,l3)],abc(:,i,l1),abc(:,i,l2),F2(1))
          call F2_Kernel([k(i,l2),k(i,l3),k(i,l1)],abc(:,i,l2),abc(:,i,l3),F2(2))
          call F2_Kernel([k(i,l3),k(i,l1),k(i,l2)],abc(:,i,l3),abc(:,i,l1),F2(3))
          bisp = bisp + fac(i) * (F2(1)*Pk(i,l1)*Pk(i,l2) + F2(2)*Pk(i,l2)*Pk(i,l3) + F2(3)*Pk(i,l3)*Pk(i,l1))
        end do
        !flat sky -> full sky
        bisp = bisp * W3j_approx(dble(l1),dble(l2),dble(l3)) * dsqrt((2d0*l1+1d0)*(2d0*l2+1d0)*(2d0*l3+1d0)/(4d0*pi))
        !SNR
        if (btype=='gkk') cov = Del*cgg(l1)*ckk(l2)*ckk(l3)
        if (btype=='ggk') cov = Del*ckk(l1)*cgg(l2)*cgg(l3)
        tot = tot + bisp**2/cov
      end do
    end do
  end do

  f = tot

end function snr_xbisp



subroutine precompute_coeff_abc(sz,kl,ki,pli,abc,model)
! precomputing F2-kernel fitting coefficitents
  implicit none
  !I/O
  character(*), intent(in) :: model
  double precision, intent(in) :: ki(:), pli(:,:), sz(:), kl(:,:)
  double precision, intent(out) :: abc(:,:,:)
  !internal
  integer :: zn, ln, i, l
  double precision :: Q3f, qan, qbn, qcn, q35, q30, q, n2, a(9)
  double precision, allocatable :: knl(:), n(:,:)

  !select a model
  select case (model)
  case('SC') 
    a = [0.25d0,3.5d0,2d0,1d0,2d0,-0.2d0,1d0,0d0,0d0]
  case('GM')  
    a = [0.484d0,3.74d0,-0.849d0,0.392d0,1.013d0,-0.575d0,0.128d0,-0.722d0,-0.926d0]
  case default
    stop 'error (precompute_coeff_abc): need to specify model of the nonlinear correction'
  end select

  zn = size(kl,dim=1)
  ln = size(kl,dim=2)

  !precompute knl and n_eff
  allocate(knl(zn),n(zn,ln)); knl=1d0; n=0d0
  call get_knl(ki,pli,knl)
  call get_neff(ki,kl,pli,n)

  !compute a, b and c
  do i = 1, zn
    do l = 1, ln
      q   = kl(i,l)/knl(i)
      n2  = 2d0**n(i,l)
      qan = (q*a(1))**(n(i,l)+a(2))
      qbn = (q*a(7))**(n(i,l)+3d0+a(8))
      qcn = (q*a(5))**(n(i,l)+3d0+a(9))
      Q3f = dsqrt(0.7d0*((4d0-n2)/(1d0+2d0*n2)))*sz(i)**a(6)
      abc(1,i,l) = (1d0 + Q3f*qan )/(1d0+qan)
      abc(2,i,l) = (1d0 + 0.2d0*a(3)*(n(i,l)+3d0)*qbn )/(1d0+qbn*dsqrt(q*a(7)))
      abc(3,i,l) = (1d0 + (4.5d0*a(4)/(1.5d0+(n(i,l)+3d0)**4d0))*qcn)/(1d0+qcn*dsqrt(q*a(5)))
    end do
    if (i==1) call savetxt('abc_z0.dat',kl(i,:),abc(1,i,:),abc(2,i,:),abc(3,i,:),ow=.true.)
    if (i==2) call savetxt('abc_z1.dat',kl(i,:),abc(1,i,:),abc(2,i,:),abc(3,i,:),ow=.true.)
  end do

  deallocate(knl,n)

end subroutine precompute_coeff_abc


subroutine get_knl(k,PkL,knl)
!* get k_NL
  implicit none
  double precision, intent(in) :: k(:), PkL(:,:)
  double precision, intent(out) :: knl(:)
  integer :: kn, zn, i, j
  double precision :: f

  kn = size(k)
  zn = size(PkL,dim=1)

  do i = 1, zn
    do j = 1, kn
      if ( PkL(i,j)*k(j)**3/(2d0*pi**2) > 1d0 ) then
        goto 11
      else
        knl(i) = k(j)
      end if
    end do
11  continue
  end do

end subroutine get_knl


subroutine get_neff(k,kl,plin,n)
! compute neff(k) at k=l/chi
  implicit none
  double precision, intent(in) :: k(:), kl(:,:), plin(:,:)
  double precision, intent(out) :: n(:,:)
  integer :: i, l, id, zn, ln

  zn = size(kl,dim=1)
  ln = size(kl,dim=2)

  do i = 1, zn
    do l = 2, ln
      ! find nearest index
      id     = neighb(kl(i,l),k)
      ! linear interpolation
      n(i,l) = (plin(i,id+1)-plin(i,id-1))/plin(i,id) * k(id)/(k(id+1)-k(id-1))
     end do
  end do
 
end subroutine get_neff


subroutine precompute_postborn(dchi,chi,chis,wlf,kl,pl,wp,ck)
! precomputing quantities relevant to the post-born correction
  implicit none
  !I/O
  double precision, intent(in) :: chis, dchi(:), chi(:), wlf(:), kl(:,:), pl(:,:)
  double precision, intent(out) :: wp(:,:), ck(:,:)
  !internal
  integer :: i, j, l, zn, ln
  double precision, allocatable :: wl(:), f(:,:)

  zn = size(kl,dim=1)
  ln = size(kl,dim=2)

  allocate(wl(zn),f(zn,zn)); wl=0d0; f=0d0

  wl = wlf*(chis-chi)*chi/chis

  do i = 1, zn
    do j = 1, zn
      if (chi(i)<=chi(j)) f(i,j) = wlf(i)*(chi(j)-chi(i))/(chi(j))*chi(i)
    end do
    wp(i,:) = pl(i,:) * ( wlf(i)/kl(i,:)**2 )**2 * dchi(i) * ((chis-chi(i))/(chis*chi(i)**2))**2
  end do

  do j = 1, zn
    do l = 2, ln
      ck(j,l) = sum(Pl(:,l)*dchi*(wl/chi)*(f(:,j)/chi))
    end do
  end do

end subroutine precompute_postborn


subroutine precompute_W3j(lmin,W3)
! precomputing W3j symbols
! require large memory for high l
  implicit none
  integer, intent(in) :: lmin
  double precision, intent(out) :: W3(:,:,:)
  integer :: lmax, l1, l2, l3

  lmax = size(W3,dim=1)

  do l1 = lmin, lmax
    do l2 = l1, lmax
      do l3 = l2, lmax
        if (l3>l1+l2.or.l3<abs(l1-l2)) cycle
        if (l1>l2+l3.or.l1<abs(l2-l3)) cycle
        if (l2>l3+l1.or.l2<abs(l3-l1)) cycle
        if (mod(l1+l2+l3,2)==1) cycle
        W3(l1,l2,l3) = W3j_approx(dble(l1),dble(l2),dble(l3)) * dsqrt((2d0*l1+1d0)*(2d0*l2+1d0)*(2d0*l3+1d0)/(4d0*pi))
      end do
    end do
  end do

end subroutine precompute_W3j


#ifdef all
subroutine error_equi_bin(eL,zn,k,Pk,Cl,fac,abc,wp,ck,bp,berr)
! binned error of LSS bispectrum
  implicit none
  integer, intent(in) :: eL(2), zn
  double precision, intent(in) :: bp(:), k(:,:), Pk(:,:), Cl(:), fac(:), abc(:,:,:), wp(:,:), ck(:,:)
  double precision, intent(out) :: berr(:,:)
  integer :: l1, l2, l3, i, b, bn
  double precision :: cov, Del, bisp(2), tot(2,bn), F2(1:3)

  berr = 0d0

  do b = 1, bn

    do l1 = bp(b), bp(b+1)-1
      write(*,*) l1
      do l2 = l1, bp(b+1)-1
        do l3 = l2, bp(b+1)-1

          if (l3>l1+l2.or.l3<abs(l1-l2)) cycle
          if (l1>l2+l3.or.l1<abs(l2-l3)) cycle
          if (l2>l3+l1.or.l2<abs(l3-l1)) cycle
          if (mod(l1+l2+l3,2)==1) cycle
          Del = 1d0
          if (l1==l2.and.l2/=l3) Del = 2d0
          if (l1/=l2.and.l2==l3) Del = 2d0
          if (l1==l2.and.l2==l3) Del = 6d0
          bisp = 0d0

          !compute F2 kernel at each z, and take sum
          do i = 1, zn
            call F2_Kernel([k(i,l1),k(i,l2),k(i,l3)],abc(:,i,l1),abc(:,i,l2),F2(1))
            call F2_Kernel([k(i,l2),k(i,l3),k(i,l1)],abc(:,i,l2),abc(:,i,l3),F2(2))
            call F2_Kernel([k(i,l3),k(i,l1),k(i,l2)],abc(:,i,l3),abc(:,i,l1),F2(3))
            bisp(1) = bisp(1) + fac(i) * (F2(1)*Pk(i,l1)*Pk(i,l2) + F2(2)*Pk(i,l2)*Pk(i,l3) + F2(3)*Pk(i,l3)*Pk(i,l1))
          end do
          bisp(2) = bisp(1)
          call bisp_postborn(l1,l2,l3,wp,ck,bisp(2))
          !flat sky -> full sky
          bisp = bisp * W3j_approx(dble(l1),dble(l2),dble(l3)) * dsqrt((2d0*l1+1d0)*(2d0*l2+1d0)*(2d0*l3+1d0)/(4d0*pi))
          !SNR
          cov = Del*Cl(l1)*Cl(l2)*Cl(l3)
          berr(:,b) = berr(:,b) + bisp**2/cov

        end do
      end do
    end do

  end do

end subroutine error_equi_bin
#endif all


end module cmblbisp

