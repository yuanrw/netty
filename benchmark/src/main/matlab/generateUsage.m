% the result run with new version
file1 = 'memory-usage-benchmark.txt';
% file1 = 'memory-usage-benchmark-small.txt';

% the result run with eailer version
file2 = 'memory-usage-benchmark-old.txt';
% file2 = 'memory-usage-benchmark-small-old.txt';
fid1 = fopen(file1);
fid2 = fopen(file2);

figure(1)

req_bytes_line = fgetl(fid1);
used_bytes_line = fgetl(fid1);
y1 = str2num(req_bytes_line);
y2 = str2num(used_bytes_line);
subplot(2, 1, 1);
hold on

x = 1:1:length(y1);
plot(x, y1, '-s', 'Color', [0 0.4470 0.7410], 'MarkerFaceColor', [0 0.4470 0.7410], 'MarkerSize', 3);
plot(x, y2, '-s', 'Color', [0.4660 0.6740 0.1880], 'MarkerFaceColor', [0.4660 0.6740 0.1880], 'MarkerSize', 3);
title('new', 'FontName', 'Arial', 'FontSize', 12)
legend({'request bytes','used bytes'},'Location','northwest')
ylim([0 200000000])

fclose(fid1);
xlabel('events'); ylabel('memory(bytes)');


req_size_line = fgetl(fid2);
used_memory_line = fgetl(fid2);
y1 = str2num(req_size_line);
y2 = str2num(used_memory_line);

subplot(2, 1, 2);

hold on
plot(x, y1, '-s', 'Color', [0 0.4470 0.7410], 'MarkerFaceColor', [0 0.4470 0.7410], 'MarkerSize', 3);
plot(x, y2, '-s', 'Color', [0.4660 0.6740 0.1880], 'MarkerFaceColor', [0.4660 0.6740 0.1880], 'MarkerSize', 3);
title('4.1.48', 'FontName', 'Arial', 'FontSize', 12)
legend({'request bytes','used bytes'},'Location','northwest')
ylim([0 200000000])

fclose(fid2);
xlabel('events'); ylabel('memory(bytes)');
