*Deck kinDAF
      Subroutine kinDAF(IOut,IPrint,kDAF,nDAF,nexit,M,deltax,sigma,
     $  DAFtol,DAFx,hermit)
C
C     Hoffman-Kouri "Distributed Approximating Functionals"
C
C     Calculate k-th derivative DAF matrix.
C     sigma and deltax need to be in atomic units.
C
C     DAFx    :  The DAF matrix, output
C     nDAF    :  Maximum size of the DAF matrix, input.
C     nexit   :  Number of non-zero elements in the DAF matrix, output.
C     deltax  :  DELTAX, input.
C     sigma   :  SIGMA, input.
C     M       :  M, hermit polynomial size, input.
C     DAFtol  :  DAF truncation criterion, input.
C
      Implicit Real*8(A-H,O-Z)
      Dimension hermit(0:*), DAFx(*)
      Data Zero/0.0d0/,One/1.0d0/,Two/2.0d0/,Eight/8.0d0/,Half/0.50d0/,
     $  Quart/0.25d0/
 1000 Format(' Distributed Approximating Functional-Numerical',
     $       ' Differentiation')
 1010 Format(2X,I3,2X,E14.7)
 1020 Format(' Derivative DAF width too wide.',/,
     $       ' Reduce QM time step or increase number of grid points.'
     $       ' Chosen DAF width ',I6)
      twopi = Eight*atan(One)
      DAFmlt = deltax/(sigma*sqrt(twopi)*((sqrt(Two)*sigma)**kDAF))
      M2 = M/2
      nexit = nDAF
      max = M+kDAF
      rdumy1 = deltax/(sqrt(Two)*sigma)
      Do 100 I=1,nDAF
        arg = rdumy1*(I-1)
        expfac = exp(-arg*arg)
        hermit(0) = expfac
        hermit(1) = Two*arg*expfac
        Do 200 J=2,max
          hermit(J) = 2.0d0*(arg*hermit(J-1)-(J-1)*hermit(J-2))
 200    Continue
        DAFx(I) = hermit(kDAF)
        pwrfac = One
        Do 300 N=1,M2
          pwrfac = -Quart*pwrfac/N
          DAFx(I) = DAFx(I) + hermit(2*N+kDAF)*pwrfac
 300    Continue
        DAFx(I) = DAFx(I) * DAFmlt
        if (abs(DAFx(I)).lt.DAFtol .and. kDAF.ne.1) then
          DAFx(I) = Zero
          nexit = I-1
          goto 10
        endif
 100  Continue
 10   if (nexit.lt.(nDAF-1)) then
        do I=nexit+2,nDAF
          DAFx(I) = Zero
        enddo
      endif
      If(kDAF.eq.1) Then
        Do I=nDAF,1,-1
          if (abs(DAFx(I)).lt.DAFtol) Then
            DAFx(I) = Zero
            nexit = I-1
          Else
            Goto 20
          Endif
        Enddo
      Endif
 20   Continue
      If(IPrint.ge.3) Then
        Write(IOut,1000)
        Do 400 I=1,nexit
          Write(IOut,1010) I,DAFx(I)
 400    Continue
      Endif
      If(nexit.eq.ndaf .and. kDAF.ne.1) Then
        Write(IOut,1000)
        Do 500 I=1,nexit
          Write(IOut,1010) I,DAFx(I)
 500    Continue
        Write(IOut,1020) ndaf
C        Call GauErr('Derivative DAF too wide.')
      Endif

      return
      end
*Deck FnCDAF
      Real*8 Function FnCDAF(R12,hermit,M,sigma,kDAF,deltaR)
      Implicit Real*8(A-H,O-Z)
      Dimension hermit(0:*)
      Data  One/1.0d0/,Two/2.0d0/,Eight/8.0d0/,Quart/0.25d0/

      twopi = Eight*atan(One)
      M2 = M/2
      max = M+kDAF
      arg = R12/(sqrt(Two)*sigma)
      expfac = exp(-arg*arg)
      hermit(0) = expfac
      hermit(1) = Two*arg*expfac
      Do 100 J=2,max
        hermit(J) = Two*(arg*hermit(J-1)-(J-1)*hermit(J-2))
 100  Continue
      rdumy1 = hermit(kDAF)
      pwrfac = One
      Do 200 N=1,M2
        pwrfac = -Quart*pwrfac/N
        rdumy1 = rdumy1 + hermit(2*N+kDAF)*pwrfac
 200  Continue
      FnCDAF = deltaR*rdumy1/(sigma*sqrt(twopi)*((-sqrt(Two)*sigma)**
     $  kDAF))

      Return
      End
