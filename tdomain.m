function [x,t]=tdomain(X,Fs)
% TDOMAIN computes the real time waveform vector x corresponding to the
%         Fourier coefficients (two-sided)
% usage: [x,t]=fdomain(X,Fs)

N=length(X);
n=0:N-1;
t=n/Fs;
X=ifftshift(X);
x=real(N*ifft(X)); % Matlab's FFT uses a different convention so we need the N factor here.