function all_data = outliers_removal(all_data,channels)

    for i = 1:length(all_data)

        for j = 1:channels
            
            a = isoutlier(all_data{i}(j,:),'mean');
            mean_value = mean(all_data{i}(j,:));
            all_data{i}(a) = mean_value;

        end

    end

end