function [] = plot_file(file, filename)

[accx, accy, accz, proximity, sound_level, latitude, longitude, altitude, ~, time] = load_file(file);
hour = hour2num(time); 
plot_sensor([latitude, longitude, altitude], hour,'GPS', filename)
plot_sensor([accx, accy, accz], hour, 'Acceleration', filename)
plot_sensor(sound_level, hour, 'Sound level', filename)
plot_sensor(proximity, hour, 'Proximity', filename)


