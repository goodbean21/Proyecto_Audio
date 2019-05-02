function daqSerial(fs, durationInSeconds, tiempo)
% Esta función es sólo cuando se tiene una tarjeta de adquisición de datos
% (DAQ). Recibe una frecuencia de sampleo, tiempo de sampleo y tiempo
% total. No tiene variables de retorno.
%%
    s = daq.createSession('ni');        % Se inicializa el objeto de la DAQ
                                        % Busca que haya una DAQ conectada al PC
                                        
    s.Rate = fs;                        % Se establece la frecuencia de sampleo
    s.DurationInSeconds = durationInSeconds; % Se establece por cuanto tiempo 
                                             % se hara una captura de la
                                             % DAQ
                                             
    addAnalogInputChannel(s, 'Dev3', 'ai1', 'Voltage'); % Se incializa un puerto
                                                        % de la DAQ para
                                                        % adquirir una
                                                        % señal analógica

    audio = [];             % Arreglo vacio donde se guardará el audio
    currentSec = 0;         % Tiempo actual

    timeInit = tic;         % Se inicializa el cronometro

    figure,
    while(currentSec < tiempo)
        [data, ~, ~] = startForeground(s);  % Se empieza la captura de la señal
        currentSec = toc(timeInit);         % Se detiene el cronometro para saber
                                            % el tiempo actual.
        
        ai1 = data(:,1);                    % Se guarda el valor obtenido por la DAQ
        
        powerSpectrum(ai1, fs);             % Se calcula el espectro de potencia y fase
                                            % y se despliegan.
        
        audio = vertcat(audio, ai1);        % Se guarda toda la señal por si acaso
        disp('Finished');
        
        clear ai1 data;
        
    end
end