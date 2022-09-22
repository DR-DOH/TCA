%function all_data = preprocess_data(all_data,channels,fs,fc,order,t_tot,st_time,method,threshold)
% 
% 
%     fn =fs/2;
%     [b , a] = butter(order,(fc/fn),'low');
% 
%     for i = 1:length(all_data)
%         all_channels = zeros(channels,t_tot*fs);
%         event_data = all_data{i};
%         for j = 1:channels
%             
%             %data = event_data(j,st_time*fs+1:(st_time+t_tot)*fs);
%             x = filtfilt(b,a,data);
%             mask = isoutlier(x,method,'ThresholdFactor',threshold);
%             median_value = median(data);
%             data(mask) = median_value;
%             data = zscore(data);
%             all_channels(j,:) = data;
% 
%         end
%         all_data{i} = all_channels;
%     end
% 
% end

function all_data = preprocess_data(all_data,channels,fs,fc,order,method,threshold)


    fn =fs/2;
    [b , a] = butter(order,(fc/fn),'low');

    for i = 1:length(all_data)
        event_data = all_data{i};
        t_tot = length(all_data{i});
        all_channels = zeros(channels,t_tot);
        for j = 1:channels
            
            data = event_data(j,:);
            x = filtfilt(b,a,data);
            mask = isoutlier(x,method,'ThresholdFactor',threshold);
            median_value = median(data);
            data(mask) = median_value;
            data = zscore(data);
            all_channels(j,:) = data;

        end
        all_data{i} = all_channels;
    end

end