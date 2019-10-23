function [low_freq,high_freq] = get_standard_freq(key_char)

switch key_char
    case '1'
        low_freq = 697;
        high_freq = 1209;
    case '2'
        low_freq = 697;
        high_freq = 1336;
    case '3'
        low_freq = 697;
        high_freq = 1477;
    case 'A'
        low_freq = 697;
        high_freq = 1633;
    case '4'
        low_freq = 770;
        high_freq = 1209;
    case '5'
        low_freq = 770;
        high_freq = 1336;
    case '6'
        low_freq = 770;
        high_freq = 1477;
    case 'B'
        low_freq = 770;
        high_freq = 1633;
     case '7'
        low_freq = 852;
        high_freq = 1209;
    case '8'
        low_freq = 852;
        high_freq = 1336;
    case '9'
        low_freq = 852;
        high_freq = 1477;
    case 'C'
        low_freq = 852;
        high_freq = 1633;
     case '*'
        low_freq = 941;
        high_freq = 1209;
    case '0'
        low_freq = 941;
        high_freq = 1336;
    case '#'
        low_freq = 941;
        high_freq = 1477;
    case 'D'
        low_freq = 941;
        high_freq = 1633;
end