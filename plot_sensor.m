function [] = plot_sensor(sensor, sensor_name, directory_to_save)

sensor_hour = hour2num(sensor{3});
fig = figure;
plot(sensor_hour, sensor{1})
title_str = strcat(strcat(sensor{2}(1,:),'-'),sensor_name);
title(title_str)
xlabel('time')
ylabel(strcat(sensor_name,' values'))
print(fig, strcat(directory_to_save,title_str),'-dpng')