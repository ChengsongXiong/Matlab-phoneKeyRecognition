function [key_num ] = get_key_num( freq_button_low,freq_button_high )
freq_error = 20;
key_num = 'null';
if abs(freq_button_low-697)<freq_error
     if abs(freq_button_high-1209)<freq_error;  key_num = '1'; end
     if abs(freq_button_high-1336)<freq_error;  key_num = '2'; end 
     if abs(freq_button_high-1477)<freq_error;  key_num = '3'; end
     if abs(freq_button_high-1633)<freq_error;  key_num = 'A'; end        
end
 
if abs(freq_button_low-770)<freq_error
     if abs(freq_button_high-1209)<freq_error;  key_num = '4'; end
     if abs(freq_button_high-1336)<freq_error;  key_num = '5'; end 
     if abs(freq_button_high-1477)<freq_error;  key_num = '6'; end
     if abs(freq_button_high-1633)<freq_error;  key_num = 'B'; end        
end
 
if abs(freq_button_low-852)<freq_error
     if abs(freq_button_high-1209)<freq_error;  key_num = '7'; end
     if abs(freq_button_high-1336)<freq_error;  key_num = '8'; end 
     if abs(freq_button_high-1477)<freq_error;  key_num = '9'; end
     if abs(freq_button_high-1633)<freq_error;  key_num = 'C'; end        
end

if abs(freq_button_low-941)<freq_error
     if abs(freq_button_high-1209)<freq_error;  key_num = '*'; end
     if abs(freq_button_high-1336)<freq_error;  key_num = '0'; end 
     if abs(freq_button_high-1477)<freq_error;  key_num = '#'; end
     if abs(freq_button_high-1633)<freq_error;  key_num = 'D'; end        
end


end

