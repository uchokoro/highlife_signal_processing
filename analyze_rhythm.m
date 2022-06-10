%%%%%%%%%%%%%%%%%%%%%%%%
%%  analyze_rhythm.m  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Matlab script to analyze the rhythm of an audio track                                                                   %%
%% It implements the computer model of human sonic-rhythmic cognition developed by Anthony U. Okoro and James E. Amaegbe,  %%
%% using a modification of the algorithm by Joseph E. Flannick, Rachel Hall and Adlai Waksman (matlab function datareduce) %%
%% Input audio should be in au or wav format                                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Algorithm parameters as specified by Joseph E. Flannick, Rachel Hall and Adlai Waksman
pow = 9;
overlap = 212; 
sep = filesep; % file path seperator for target platform

% Specify audio input source for algorithm
audio_source.filepath = 'C:\Users\antoine\Desktop\antonio\highlife tracks\docs\rhythmic integrity\software\research audio tracks\Rex Lawson'; % filepath
audio_source.audiofile = 'Nume Inye.wav'; % file name
audio_to_analyze = [audio_source.filepath, sep, audio_source.audiofile];

try
[err_message, bpm] = datareduce(audio_to_analyze, overlap, pow, bandwidth); % process the audio file to extract its tempo using the datareduce matlab function

if err_message ~= 0
error(err_message)
end

bpm% Display the result of the analysis on the console, if no error

catch ME
out_message = ['Error! Could not analyze the audio file: ',audio_to_analyze, '. Reason: ',ME.message];
disp(out_message)
end