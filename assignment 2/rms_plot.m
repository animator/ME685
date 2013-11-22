time_rms = [0.0:dt:time-dt];
rms_value = 0.0*ones([length(time_rms),1]);
for k=1:length(time_rms),
    for i=1:Nz+1,
        rms_value(k) = rms_value(k) + (temp_ana_time(k,i)-temp_num_time(k,i))^2;
    end
    rms_value(k) = (rms_value(k)/(Nz+1))^0.5;
end

plot(time_rms,rms_value);
axis([0 time 0 0.2]);