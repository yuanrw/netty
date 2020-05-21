% fid = fopen('memory-layout-benchmark.txt');

% the result run with eailer version
fid = fopen('memory-layout-benchmark-old.txt');

set(gca, 'color', 'k');
 
hold on
cnt = 1;
len_line = fgetl(fid);
while ischar(len_line)
    len = str2double(strsplit(len_line, ','));
    b = bar(cnt, len, 'stacked');
    
    color_line = fgetl(fid);
    color = strsplit(color_line, ',');
    for i = 1:length(color)
        c = cell2mat(color(i));
        if c == 'g'
           c = [0.4660 0.6740 0.1880];
        elseif c == 'b'
           c = [0 0.4470 0.7410];
        else
            c = 'k';
        end
        b(i).FaceColor = c;
    end
     
    len_line = fgetl(fid);
    cnt = cnt + 1;
end
fclose(fid);

title('chunk layout 4.1.48', 'FontName', 'Arial', 'FontSize', 15)
legend({'full/half used','fragmented'},'Location','northwest','FontSize',11,'TextColor','w')
xlim([1 100]);
ylim([1 2048]);
xlabel('events'); ylabel('page idx');


