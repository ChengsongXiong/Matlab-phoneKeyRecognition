function [ wav_div ] = create_wav_div(sample_data)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
 [~,maxl]=findpeaks(sample_data,'minpeakheight',0.01);
 maxl_length = size(maxl,1);

 maxl_div = zeros(1,100);
 maxl_div(1) = 1;
 k = 2;
 
 for i=2:maxl_length-1
     if (maxl(i+1)-maxl(i))>10*(maxl(i)-maxl(i-1))
         maxl_div(k) = maxl(i);
         maxl_div(k+1) = maxl(i+1);
          k = k+2;
     end
     if (i == maxl_length-1)
         maxl_div(k) = maxl(maxl_length);
     end
 end
maxl_div = maxl_div(1:k);
wav_div = maxl_div;

end

