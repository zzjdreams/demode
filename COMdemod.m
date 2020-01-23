function varargout = COMdemod(varargin)
% COMDEMOD MATLAB code for COMdemod.fig
%      COMDEMOD, by itself, creates a new COMDEMOD or raises the existing
%      singleton*.
%
%      H = COMDEMOD returns the handle to a new COMDEMOD or the handle to
%      the existing singleton*.
%
%      COMDEMOD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMDEMOD.M with the given input arguments.
%
%      COMDEMOD('Property','Value',...) creates a new COMDEMOD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before COMdemod_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to COMdemod_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help COMdemod

% Last Modified by GUIDE v2.5 20-Oct-2019 19:26:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @COMdemod_OpeningFcn, ...
                   'gui_OutputFcn',  @COMdemod_OutputFcn, ...
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


% --- Executes just before COMdemod is made visible.
function COMdemod_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to COMdemod (see VARARGIN)

% Choose default command line output for COMdemod
addpath('s(t)','s(t)/MSK','page');
handles.output = hObject;

set(handles.text_content,'position',[1,-20, 160, 50] ,'value',1);
set(handles.figure1,'WindowScrollWheel',@(hObject,eventdata)COMdemod...
    ('figure1_WindowScrollWheelFcn',hObject,eventdata,guidata(hObject)))
% 添加滚轮事件

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes COMdemod wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = COMdemod_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_test.
function btn_test_Callback(hObject, eventdata, handles)
% hObject    handle to btn_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
subGUI;

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%　取得滚动条的值
pos = get(hObject,'value');
%　设置panel的位置（左下角点的纵坐标)。
set(handles.text_content,'position',[1,-20*pos, 160, 50]);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function figure1_WindowScrollWheelFcn(hObject, eventdata, handles)
% 获取目前滚动条的值
slidervalue = get(handles.slider1,'value');

% 获取鼠标滚轮的值，向前滚为正，向后滚为负
scrollvalue = eventdata.VerticalScrollCount/10;

% 确定滚动量
movevalue = slidervalue - scrollvalue;

% 限制滚动范围（防止整个面板都滚出图形）
if movevalue >1
    movevalue = 1;
elseif movevalue < 0
    movevalue = 0;
end

% 使滚动条的方块的位置与滚轮的滚动同步
set(handles.slider1,'value',movevalue);
% 获取figure和panel的位置
panel1pos = get(handles.uipanel46,'position');
panel2pos = get(handles.text_content,'position');

% 更新panel的位置
panel2pos(2) = -(panel2pos(4)-panel1pos(4))*movevalue;
set(handles.text_content,'position',panel2pos);
guidata(hObject,handles);

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

strl=readw("page/page1.txt",10000);
set(handles.text_content,'String',strl);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
str2=readw("page/page2.txt",10000);
set(handles.text_content,'String',str2)


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
str3=readw("page/page3.txt",10000);
set(handles.text_content,'String',str3);


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
str4=readw("page/page4.txt",10000);
set(handles.text_content,'String',str4)


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
str5=readw("page/page5.txt",10000);
set(handles.text_content,'String',str5)


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
str6=readw("page/page6.txt",10000);
set(handles.text_content,'String',str6)


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7
str7=readw("page/page7.txt",10000);
set(handles.text_content,'String',str7)


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9
str9=readw("page/page8.txt",10000);
set(handles.text_content,'String',str9)


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8

str8=readw("page/page9.txt",10000);
set(handles.text_content,'String',str8)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over radiobutton2.
function radiobutton2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
