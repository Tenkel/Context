function [] = plot_file(file, directory_to_save)
    [gps, accel, compass, gyroscope, context] = load_file(file);
    plot_sensor(gps,'GPS', directory_to_save)
    plot_sensor(accel,'Acceleration', directory_to_save)
    plot_sensor(compass,'Compass', directory_to_save)
    plot_sensor(gyroscope,'Gyroscope', directory_to_save)


