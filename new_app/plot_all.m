listing = dir('RafaelLogs');
names = {};
for i=3:length(listing)
    name = listing(i).name;
    plot_file(strcat('RafaelLogs/',name), strcat('Figs/',name(15:22)))
end