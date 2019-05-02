function audioRecorder(recObj, tiempo_de_sampleo)
% Esta funci�n s�lo tiene por funci�n guardar el audio y llamar a la
% funci�n de despliegue de datos. Recibe como parametros de entrada el
% objeto de record de audio, el tiempo de sampleo y la ventana del espectro
% de frecuencia. No tiene una variable de retorno.
%%
currentSec = 0;                         % Tiempo actual

record(recObj);                         % Empezar a grabar

timeInit = tic;                         % Se empieza el cronometro
while(currentSec < tiempo_de_sampleo)
    % Este ciclo correra mientras que el tiempo actual cronometrado sea
    % menor a la ventana de sampleo
    currentSec = toc(timeInit);         % Se detiene el cronometro
    
end
stop(recObj);                           % Se cierra el objeto de record
                                        % para terminar de grabar

% take = tic;                             % Esta variable es para conocer
                                        % cuanto tarda en hacer la funci�n
                                        % de audioRecorder
                                        
rawAudio = getaudiodata(recObj);        % Se guarda el audio obtenido en un arreglo
% disp('le tomo: '), disp(toc(take));     % Se despliega cuanto tard� en
                                        % grabar
                                        
powerSpectrum(rawAudio, recObj.SampleRate);
    % Esta funci�n calcula el espectro de potencia y de fase al igual que
    % despliega los resultados, y tambi�n despliega la se�al de audio
    % :Param rawAudio: El audio obtenido guardado en un arreglo de doubles
    % :Param recObj.SampleRate: La frecuencia de sampleo del objeto de
    %                           record.
    % :Return: No tiene variable de retorno

end