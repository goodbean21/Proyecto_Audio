function [P1, f]= powerSpectrum(y, fs)
% Esta funci�n recibe una se�al y la frecuencia con la que se sampleo dicha
% se�al para poder calcular su espectro de frecuencia y espectro de fase
% por medio de la transformada r�pida de Fourier de ventana corta. Retorna
% el espectro de potencia en sus componentes Magnitud y frecuencia.
%%

    Y1 = fft(y);                     % Transformada r�pida de Fourier de la se�al de audio sin procesar
    
    L = length(Y1);                  % number of samples
    
    phase = angle(Y1) * (180/pi);    % C�lculo del espectro de fase y su conversi�n a grados
    
%     figure,
    subplot(1,3,1), plot(y), title('Audio sin procesar');

    P2 = abs(Y1/L);                 % Tomar s�lo la parte positiva del espectro de Fourier
    P1 = P2(1:L/2+1);               % Tomar s�lo la mitad del espectro, repetici�n de se�ales
    P1(2:end-1) = 2*P1(2:end-1);    % Reescribir P1 en funci�n de los nuevos datos
    f = fs*(0:(L/2))/L;             % Dominio de frecuencia en funci�n del n�mero 
                                    % De samples y la frecuencia de sampleo
    subplot(1,3,2),plot(f(1:end-1),P1(1:end-1));
    title('Single-Sided Amplitude Spectrum of X(t)')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')
    
    P2 = abs(phase/L);              % Tomar s�lo la parte positiva del espectro de Fourier
    P1 = P2(1:L/2+1);               % Tomar s�lo la mitad del espectro, repetici�n de se�ales
    P1(2:end-1) = 2*P1(2:end-1);    % Reescribir P1 en funci�n de los nuevos datos
    P1 = detrend(P1, 'linear', 5);

    subplot(1,3,3),plot(f(1:end-1),P1(1:end-1));
    title('Single-Sided Phase Spectrum of X(t)')
    xlabel('f (Hz)')
    ylabel('|P2(rad)|')
    
    pause(0.1)
    

end