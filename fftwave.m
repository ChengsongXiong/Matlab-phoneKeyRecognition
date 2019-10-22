clc;
[sample_data,fs]= audioread('dialWav.wav');

maxl_div = create_wav_div(sample_data);
maxl_div_length = size(maxl_div,2);

k = 2;

disp('按键的顺序为:')

 for j = 1:maxl_div_length
     
 if rem(j,2)==1
 
        sample_data_1 = sample_data(maxl_div(1,j):maxl_div(1,j+1));

        pointsNum = size(sample_data_1,1);
        L = pointsNum;
        n = 0:L-1;
        T = 1/fs;
        t = (0:L-1)*T;

%             figure(j)
%             subplot(1,2,1)  
%             plot(fs*t(1:L),sample_data_1(1:L),'g');
%             plot(maxl,maxv,'r*');
%             title('原始音频信号');
        
        
        NFFT = 2^nextpow2(L);
        y = fft(sample_data_1,NFFT)/L;
        f = fs/2*linspace(0,1,NFFT/2+1);
        freq_y = 2*abs(y(1:NFFT/2+1));

%             subplot(1,2,2)
%             plot(f,freq_y,'b');
%             title('幅频特性');
%             grid on;

        if max(freq_y)>0.0075
            
            [~,freq_button]=findpeaks(freq_y,'minpeakheight',0.0075);
            freq_y_l = size(freq_y,1);
            freq_button = freq_button*(fs/2)/freq_y_l;
         
            if freq_button~=0
          
                freq_button_low = freq_button(1);
                freq_button_high = freq_button(2);

                keychar = get_key_num(freq_button_low ,freq_button_high);
                disp(keychar)
            end
        end
 end
     
 end

 

 


% subplot(1,3,3)
% 
% yh = hilbert(sample_data);
% pha = unwrap(angle(yh));
% af = diff(pha)/2/pi;
% ff = af*fs;
% plot(t(1:end-1),ff);
% 
% ff1 = 10*find((ff>695)&(ff<700))/80000;
% ff2 = 10*find((ff>1207)&(ff<1212))/80000;
% 
% xlabel('Time');
% ylabel('Frequency');
