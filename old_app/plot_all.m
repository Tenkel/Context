listing = dir('RafaelLogs');
names = {};
for i=1:length(listing)
    if listing(i).name(1)=='S'
        [gps, accel, compass, gyroscope, context] = load_file(strcat('RafaelLogs/',listing(i).name));
        plot_file(strcat('RafaelLogs/',listing(i).name), 'Figs/')
    end
end

