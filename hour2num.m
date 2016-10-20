function [hour_num] = hour2num(hour)

hour_num = (str2num(hour(:,1))*3600*10 + str2num(hour(:,2))*3600 + str2num(hour(:,4))*60*10 + str2num(hour(:,5))*60 + str2num(hour(:,7))*10 + str2num(hour(:,8)) + str2num(hour(:,10))*0.1 + str2num(hour(:,11))*0.01 + str2num(hour(:,12))*0.001 + str2num(hour(:,13))*0.0001)/3600;
