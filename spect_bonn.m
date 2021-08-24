close all;
clear all;
for k = 1:100
    if k<10
       filename = sprintf('O00%d.txt',k);
       A(:,k) = load(filename); 
    elseif k<100
       filename = sprintf('O0%d.txt',k);
       A(:,k) = load(filename); 
    else
       filename = sprintf('O%d.txt',k);
       A(:,k) = load(filename);
    end
end
record = A;
B=record;
lgh=length(record);
max_block_length=4000
for channel=1:100
    eval(['AF' num2str(channel) '_before' '=record(1:lgh,channel)']);
    A=eval(['AF' num2str(channel) '_before']);
    B=transpose(A);
    fs=max(abs(fft(A)));
    if fs~=0        
    spectrogram(A,rectwin(max_block_length),0,max_block_length,fs);
    saveas(gcf,fullfile('C:\Users\Saneesh\iCloudDrive\Documents\Research iCloud\PhD\Work\Master\BonnData\Images\Spectrogram\Healthy',strcat('O',num2str(channel),'.png')));
    end
end