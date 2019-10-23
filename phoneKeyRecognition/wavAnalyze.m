function varargout = wavAnalyze(varargin)
% WAVANALYZE MATLAB code for wavAnalyze.fig
%      WAVANALYZE, by itself, creates a new WAVANALYZE or raises the existing
%      singleton*.
%
%      H = WAVANALYZE returns the handle to a new WAVANALYZE or the handle to
%      the existing singleton*.
%
%      WAVANALYZE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WAVANALYZE.M with the given input arguments.
%
%      WAVANALYZE('Property','Value',...) creates a new WAVANALYZE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wavAnalyze_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wavAnalyze_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wavAnalyze

% Last Modified by GUIDE v2.5 23-Oct-2019 21:06:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wavAnalyze_OpeningFcn, ...
                   'gui_OutputFcn',  @wavAnalyze_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT



% --- Executes just before wavAnalyze is made visible.
function wavAnalyze_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wavAnalyze (see VARARGIN)

% Choose default command line output for wavAnalyze
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes wavAnalyze wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = wavAnalyze_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB

% handles    empty - handles not created until after all CreateFcns called




% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata,handles)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%'E:\大四上课程\测试与检测技术基础\选作作业\dialWav.wav'
global  Origin_wave;
global  Amplitude_frequency;
global  key_string;
file_path = get(handles.edit1,'string');
wav_file = char(file_path);

key_string = '';


[sample_data,fs]= audioread(wav_file);
sample_length = size(sample_data,1);

maxl_div = create_wav_div(sample_data);
maxl_div_length = size(maxl_div,2);


Origin_wave = cell(2,maxl_div_length/2);
Amplitude_frequency = cell(2,maxl_div_length/2);

l = 1 ;
 

for j = 1:maxl_div_length
 
 if rem(j,2)==1
        sample_data_1 = sample_data(maxl_div(1,j):maxl_div(1,j+1));
        pointsNum = size(sample_data_1,1);
        L = pointsNum;
        T = 1/fs;
        t = (0:L-1)*T;

        NFFT = 2^nextpow2(L);
        y = fft(sample_data_1,NFFT)/L;
        f = fs/2*linspace(0,1,NFFT/2+1);
        freq_y = 2*abs(y(1:NFFT/2+1));

        if max(freq_y)>0.0075
            X1 = t(1:L);
            Y1 = sample_data_1(1:L);

            Origin_wave{1,l} = X1;
            Origin_wave{2,l} = Y1;    
            
            X2 = f;
            Y2 = freq_y;
            Amplitude_frequency{1,l}= X2;
            Amplitude_frequency{2,l} = Y2;
            
            
            l = l+1;
            
            [~,freq_button]=findpeaks(freq_y,'minpeakheight',0.0075);
            freq_y_l = size(freq_y,1);
            freq_button = freq_button*(fs/2)/freq_y_l;
         
            if freq_button~=0
                freq_button_low = freq_button(1);
                freq_button_high = freq_button(2);
                
                keychar = get_key_num(freq_button_low ,freq_button_high);
                %disp(keychar)
                key_string = [key_string num2str(keychar)];
       
            end
        end
 end
 end

key_string_length = length(key_string);
List_value = cell(1,key_string_length);

for i=1:key_string_length
    List_value{1,i} = i;
end 
 
T0=1/fs;
t0 = T0*(1:1:sample_length);

axes(handles.axes1);
plot(t0,sample_data,'b');
xlabel('Time(s)');
ylabel('Amplitude');

set(handles.text2,'string',key_string);
%set(handles.popupmenu1,'value', 1);
set(handles.popupmenu1,'string', List_value);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text2.
function text2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname] = uigetfile('.wav','选择音频文件');
fpath = [pathname filename];
set(handles.edit1,'string',fpath);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global  Origin_wave;
global Amplitude_frequency;
global key_string;
key_string_1 = key_string;
list_value = get(handles.popupmenu1,'value');

Origin_wave_1 = Origin_wave;
Amplitude_frequency_1 = Amplitude_frequency;

axes(handles.axes2)
origin_wave_x = Origin_wave_1{1,list_value};
origin_wave_y = Origin_wave_1{2,list_value};
plot(origin_wave_x,origin_wave_y,'g');
xlabel('Time(s)');
ylabel('Amplitude');

axes(handles.axes3)
amplitude_frequency_x = Amplitude_frequency_1{1,list_value};
amplitude_frequency_y = Amplitude_frequency_1{2,list_value};
 plot(amplitude_frequency_x,amplitude_frequency_y,'r');
 xlabel('Frequency(Hz)');
ylabel('Amplitude');
 
 [~,button_freq] = findpeaks(amplitude_frequency_y,'minpeakheight',0.0075);
 button_freq_low = amplitude_frequency_x(button_freq(1));
 button_freq_high = amplitude_frequency_x(button_freq(2));
 
 key_char = key_string_1(list_value);
 [standard_freq_low,standard_freq_high] = get_standard_freq(key_char);
 
 set(handles.text12,'string',['按键值：',key_char]);
 set(handles.text14,'string',['测量低频：',num2str(button_freq_low),'Hz']);
 set(handles.text13,'string',['测量高频：',num2str(button_freq_high),'Hz']);
 set(handles.text16,'string',['标准低频：',num2str(standard_freq_low),'Hz']);
 set(handles.text15,'string',['标准高频：',num2str(standard_freq_high),'Hz']);
 
