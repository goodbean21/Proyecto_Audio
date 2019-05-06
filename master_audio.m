function master_audio(tiempo_de_sampleo, tiempo_Total)
% Master Audio:
% Esta función es para utilizar el microfono de la laptop en tiempo real y
% de forma continua. Sólo se tiene que correr este código, no recibe
% variables de entrada y no tiene variables de salida.

%%
    close all
    clc

    currentSec = 0;             % Variable donde se guarda el tiempo actual
    % tiempo_Total = 10;          % Tiempo total de adquisición

    fs = 20000;                 % Frecuencia de Sampleo
    nBits = 16;                 % Resolución de adquisición
    % tiempo_de_sampleo = 2;      % Tiempo de muestreo
    ventana_espectro = 10000;   % Tamaño de la ventana del plot
    nChannels = 1;              % Números de canales de adquisición

    recObj = audiorecorder(fs, nBits, nChannels);   
            % Generar el objeto de adquisición de audio
            % :Param fs: Frecuencia con la que se hará el muestreo con el mic
            % :Param nBits: Es el número de bits que nos dirá la resolución 
            %               Sólo acepta números enteros dentro del siguiente
            %               set [8, 12, 16].
            % :Param nChannels: El número de canales que grabara, dependerá del
            %                   número de microfonos presentes por default es 1
            % :Rerturn recObj: Objeto donde se estará guardando el audio

    timeInit = tic;                 % Inicia el cronometro con la función tic

    while(currentSec < tiempo_Total)
        % Este es un ciclo que sólo corre mientras el tiempo cronometrado sea
        % menor al tiempo total.

        currentSec = toc(timeInit); % Cronometra el tiempo actual

        audioRecorder(recObj, tiempo_de_sampleo)
        % audioRecorder es una función que tiene por función salvar el audio que
        % capte el microfono en un tiempo determinado y despliega el espectro
        % de potencia, de fase y la señal dentro de una ventana determinada.
        % :Param recObj: Objeto donde se guarda el audio
        % :Param tiempo_de_sampleo: Ventana de tiempo de guardado de audio
        % :Param ventana_espectro: Ventana de despliegue de datos
        % :Return: No tiene variable de retorno

    end

    disp('finalizado');
    clear all

end