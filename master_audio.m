function master_audio(tiempo_de_sampleo, tiempo_Total)
% Master Audio:
% Esta funci�n es para utilizar el microfono de la laptop en tiempo real y
% de forma continua. S�lo se tiene que correr este c�digo, no recibe
% variables de entrada y no tiene variables de salida.

%%
    close all
    clc

    currentSec = 0;             % Variable donde se guarda el tiempo actual
    % tiempo_Total = 10;          % Tiempo total de adquisici�n

    fs = 20000;                 % Frecuencia de Sampleo
    nBits = 16;                 % Resoluci�n de adquisici�n
    % tiempo_de_sampleo = 2;      % Tiempo de muestreo
    ventana_espectro = 10000;   % Tama�o de la ventana del plot
    nChannels = 1;              % N�meros de canales de adquisici�n

    recObj = audiorecorder(fs, nBits, nChannels);   
            % Generar el objeto de adquisici�n de audio
            % :Param fs: Frecuencia con la que se har� el muestreo con el mic
            % :Param nBits: Es el n�mero de bits que nos dir� la resoluci�n 
            %               S�lo acepta n�meros enteros dentro del siguiente
            %               set [8, 12, 16].
            % :Param nChannels: El n�mero de canales que grabara, depender� del
            %                   n�mero de microfonos presentes por default es 1
            % :Rerturn recObj: Objeto donde se estar� guardando el audio

    timeInit = tic;                 % Inicia el cronometro con la funci�n tic

    while(currentSec < tiempo_Total)
        % Este es un ciclo que s�lo corre mientras el tiempo cronometrado sea
        % menor al tiempo total.

        currentSec = toc(timeInit); % Cronometra el tiempo actual

        audioRecorder(recObj, tiempo_de_sampleo)
        % audioRecorder es una funci�n que tiene por funci�n salvar el audio que
        % capte el microfono en un tiempo determinado y despliega el espectro
        % de potencia, de fase y la se�al dentro de una ventana determinada.
        % :Param recObj: Objeto donde se guarda el audio
        % :Param tiempo_de_sampleo: Ventana de tiempo de guardado de audio
        % :Param ventana_espectro: Ventana de despliegue de datos
        % :Return: No tiene variable de retorno

    end

    disp('finalizado');
    clear all

end