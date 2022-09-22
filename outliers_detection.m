function outs = outliers_removal(all_data)
    outs = 0;
    for i = 1:length(all_data)

        a = isoutliers(all_data{i});
        mean_val = 
        outs = outs + sum(a);

    end

end