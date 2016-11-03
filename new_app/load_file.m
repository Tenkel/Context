function [accx, accy, accz, proximity, sound_level, latitude, longitude, altitude, acuracia_gps, time] = load_file(filename)
%% Initialize variables.
delimiter = ';';
startRow = 3;

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column9: double (%f)
%   column11: double (%f)
%	column16: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%f%f%*s%f%*s%f%*s%*s%*s%*s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
accx = dataArray{:, 1};
accy = dataArray{:, 2};
accz = dataArray{:, 3};
proximity = dataArray{:, 4};
sound_level = dataArray{:, 5};
latitude = dataArray{:, 6};
longitude = dataArray{:, 7};
altitude = dataArray{:, 8};
acuracia_gps = dataArray{:, 9};
time = dataArray{:, 10};
