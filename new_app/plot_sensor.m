function [] = plot_sensor(sensor, time, sensor_name, filename)

fig = figure;
plot(time, sensor)
title_str = strcat(strcat(filename(6:end),'-'),sensor_name);
title(title_str)
xlabel('time')
ylabel(strcat(sensor_name,' values'))
print(fig, title_str,'-dpng')