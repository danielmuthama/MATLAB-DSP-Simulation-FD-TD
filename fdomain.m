function [X,f]=fdomain(x,Fs)
% FDOMAIN Function to compute the Fourier coefficients from vector x
%   and the corresponding frequencies (two-sided)
% usage:
%   [X,f]=fdomain(x,Fs)
%         x=vector of time domain samples
%         Fs=sampling rate (in Hz)
%         X=vector of complex Fourier coefficients
%         f=vector of corresponding frequencies (two-sided)

N=length(x);

if mod(N,2)==0
    k=-N/2:N/2-1; % N even
else
    k=-(N-1)/2:(N-1)/2; % N odd
end

T0=N/Fs;    % Duration of signal
f=k/T0;     % wavenumbers (k) divided by T0 = frequencies
X=fft(x)/N; % Matlab's FFT uses a different convention without the 1/N so we put it in here.
X=fftshift(X);