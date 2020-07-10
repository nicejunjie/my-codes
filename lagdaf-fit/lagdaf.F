*Deck lagDAF
      Subroutine lagDAF(IOut,IPrint,NGrid,Nx,Ny,Nz,IX1,IY1,IZ1,ICrosX,
     $  ICrosY,ICrosZ,Rho,DAF0x,DAF0y,DAF0z,Scr,Coeff,NDimQM,PolyX,
     $  PolyY,PolyZ,IFlag,iminx,iminy,iminz,imaxx,imaxy,imaxz)
C
C     Computes the Lagrange DAF coefficents at one grid for wavepacket 
C     averaging of gradients.
C
C     IX1, IY1, IZ1: represent the integer coodinates of the grid point where 
C                    the coefficient is to be determined.
C     ICrosX, ICrosY, ICrosZ: An integer array that stores the coordinates of 
C                    points where gradients are known. The points in 
C                    ICrosX represent a X-direction straight line passing 
C                    through IX1, IY1, IZ1. Similarly for ICrosY, ICrosZ.
C     DAF0x, DAF0y and DAF0z are assumed to be full matrices as obtained from 
C     getkin, but for 0th derivative (THIS IS AN INCORRECT WAY TO PERFORM
C     THIS INTERPOLATION. SEE IYENGAR, ET AL., JCP 122:ISAIAH 11/07/07).
C
      Implicit Real*8(A-H,O-Z)
      Dimension PolyX(*),PolyY(*),PolyZ(*),Rho(*),DAF0x(*),DAF0y(*),
     $  DAF0z(*),Scr(*),ICrosX(*),ICrosY(*),ICrosZ(*)
      Data One/1.0d0/,Zero/0.0d0/,Two/2.0d0/
C
      Call ASet(Nx,One,PolyX)
      Do 10 IX=1,Nx
        Do  I=1,NX
          If(I.ne.IX1.AND.ICrosX(I).ne.0) 
     $      PolyX(IX)=PolyX(IX)*dfloat((IX-I))/dfloat((IX1-I))
        EndDo
          Call DSCal(Nx,PolyX(IX),DAF0x((IX-1)*Nx+1),1)
 10   Continue
      If(NDimQM.ge.2) Then
        Call ASet(Ny,One,PolyY)
        Do  20 IY=1,Ny
          Do  I=1,Ny
            If(I.ne.IY1.AND.ICrosY(I).ne.0) 
     $        PolyY(IY)=PolyY(IY)*dfloat((IY-I))/dfloat((IY1-I))
          EndDo
          Call DSCal(Ny,PolyY(IY),DAF0y((IY-1)*Ny+1),1)
 20     Continue
      EndIf
      If(NDimQM.eq.3) Then
        Call ASet(Nz,One,PolyZ)
        Do  30 IZ=1,Nz
          Do  I=1,Nz
            If(I.ne.IZ1.AND.ICrosZ(I).ne.0) 
     $        PolyZ(IZ)=PolyZ(IZ)*dfloat((IZ-I))/dfloat((IZ1-I))
          EndDo
          Call DSCal(Nz,PolyZ(IZ),DAF0z((IZ-1)*Nz+1),1)
 30     Continue
      EndIf
C
      NTotPt=NGrid
      If(IFlag.eq.2) goto 999
      If(NDimQM.eq.1) Then
        Call DGeMM('N','N',Nx,Ny*Nz,Nx,One,DAF0x,Nx,rho,Nx,Zero,
     $    rho(1+NGrid),Nx)
        goto 999
      ElseIf(NDimQM.eq.2) Then
        nDAF = Ny
C
C     Propagate along Y, and then X
C
        Call dgemm( 'n','t',nDAF,Nx,nDAF,one,DAF0y,nDAF,rho,Nx,zero,Scr,
     $    nDAF)
        nDAF = Nx
C
C     X,Y
C
        Call dgemm( 'n','t',nDAF,Ny,nDAF,one,DAF0x,nDAF,Scr,Ny,zero,
     $    rho(1+NGrid),nDAF)
      ElseIf(NDimQM.eq.3) Then
        nDAF =Nz
        Ndumy=NTotPt/NDaf
        Call dgemm( 'n','t',nDAF,Ndumy,nDAF,one,DAF0z,nDAF,
     $    rho,NDumy,zero,Scr,nDAF)
C     
C     Y,ZX
C
        nDAF =Ny
        NDumy=NTotPt/nDAF
        call dgemm( 'n','t',nDAF,Ndumy,nDAF,one,DAF0y,nDAF,
     $    Scr,NDumy,zero,Scr(NGrid+1),Ny)
C     
c     X,YZ
C
        nDAF =Nx
        Ndumy=NTotPt/nDAF
        call dgemm( 'n','t',nDAF,Ndumy,nDAF,one,DAF0x,nDAF,
     $    Scr(NGrid+1),NDumy,zero,rho(1+NGrid),Nx)
      EndIf
C
 999  Continue
      If(IFlag.eq.0) Then
        Coeff = Arrsum(Nx*Ny*Nz,rho(1+NTotPt))
      ElseIf(IFlag.eq.1) Then
        sum2=Zero
        Do I=1,NTotPt
          Call GenPnt(I,ix0,iy0,iz0,ix1,iy1,iz1,Nx,Ny,Nz,0,0,0,0,0,0,
     $      0,0,0,0,0,NumBox,4)
          If((ix0.ge.iminX.AND.ix0.le.imaxX).AND.
     $      (iy0.ge.iminY.AND.iy0.le.imaxY).AND.
     $      (iz0.ge.iminZ.AND.iz0.le.imaxZ)) Then
            sum2=sum2+rho(I+NTotPt)
          EndIf
        EndDo
        Coeff=sum2
      EndIf
      
      Return
      End

