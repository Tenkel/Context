function [gps, accel, compass, gyroscope, context] = load_file(file)

file = importdata(file);

% -----
% GPS
% -----

gps = [];
gps_date = [];
gps_hour = [];
index = find(strcmp(file,'GPS'))+2;
while 1
    data = char(file(index));
    data = strsplit(data,',');
    if length(data)==4
        latitude = eval(char(data(1)));
        longitude = eval(char(data(2)));
        altitude = eval(char(data(3)));
        
        time = strsplit(char(data(4)));
        gps_date = [gps_date; char(time(2))];
        gps_hour = [gps_hour; char(time(3))];
        gps = [gps; [latitude, longitude, altitude]];
    else
        break;
    end    
    index = index + 1;
end
gps = {gps, gps_date, gps_hour};

% -----
% Accel.
% -----

accel = [];
accel_date = [];
accel_hour = [];
index = find(strcmp(file,'Accel.'))+2;
while 1
    data = char(file(index));
    data = strsplit(data,'g,');
    if length(data)==4
        accelx = eval(char(data(1)));
        accely = eval(char(data(2)));
        accelz = eval(char(data(3)));
        
        time = strsplit(char(data(4)));
        accel_date = [accel_date; char(time(2))];
        accel_hour = [accel_hour; char(time(3))];
        accel = [accel; [accelx, accely, accelz]];
    else
        break;
    end    
    index = index + 1;
end
accel = {accel, accel_date, accel_hour};

% -----
% Compass
% -----

compass = [];
compass_date = [];
compass_hour = [];
index = find(strcmp(file,'Compass'))+2;
while 1
    data = char(file(index));
    data = strsplit(data,',');
    if length(data)==3
        compass_1 = eval(char(data(1)));
        compass_2 = eval(char(data(2)));
        
        time = strsplit(char(data(3)));
        compass_date = [compass_date; char(time(2))];
        compass_hour = [compass_hour; char(time(3))];
        compass = [compass; [compass_1, compass_2]];
    else
        break;
    end    
    index = index + 1;
end
compass = {compass, compass_date, compass_hour};

% -----
% Gyroscope
% -----

gyroscope = [];
gyroscope_date = [];
gyroscope_hour = [];
index = find(strcmp(file,'Gyroscope'))+2;
while 1
    data = char(file(index));
    data = strsplit(data,',');
    if length(data)==4
        gyroscopex = eval(char(data(1)));
        gyroscopey = eval(char(data(2)));
        gyroscopez = eval(char(data(3)));
        
        time = strsplit(char(data(4)));
        gyroscope_date = [gyroscope_date; char(time(2))];
        gyroscope_hour = [gyroscope_hour; char(time(3))];
        gyroscope = [gyroscope; [gyroscopex, gyroscopey, gyroscopez]];
    else
        break;
    end    
    index = index + 1;
end
gyroscope = {gyroscope, gyroscope_date, gyroscope_hour};

% -----
% Context
% -----

context = {};
context_date = [];
context_hour = [];
index = find(strcmp(file,'Context'))+2;
while index<length(file)
    data = char(file(index));
    data = strsplit(data,',');
    if length(data)==2
        if ~isempty(char(data(1)))
            context = [context; char(data(1))];
            time = strsplit(char(data(2)));
            context_date = [context_date; char(time(2))];
            context_hour = [context_hour; char(time(3))];
        end
    else
        break;
    end    
    index = index + 1;
end
context = {context, context_date, context_hour};
