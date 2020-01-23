function varargout = tonxin(varargin)
% TONXIN MATLAB code for tonxin.fig
%      TONXIN, by itself, creates a new TONXIN or raises the existing
%      singleton*.
%
%      H = TONXIN returns the handle to a new TONXIN or the handle to
%      the existing singleton*.
%
%      TONXIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TONXIN.M with the given input arguments.
%
%      TONXIN('Property','Value',...) creates a new TONXIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tonxin_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tonxin_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tonxin

% Last Modified by GUIDE v2.5 04-Jul-2019 17:58:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tonxin_OpeningFcn, ...
                   'gui_OutputFcn',  @tonxin_OutputFcn, ...
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

%----------------------------------------------------------------------

% --- Executes just before tonxin is made visible.
function tonxin_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tonxin (see VARARGIN)

% Choose default command line output for tonxin
handles.output = hObject;

movegui(gcf,'center');
% 设置界面居中显示

% Update handles structure
guidata(hObject, handles);
strl=readw("page1.txt",10000);
set(handles.text1,'String',strl);
str2=readw("page2.txt",10000);
set(handles.text2,'String',str2)
str3=readw("page3.txt",10000);
set(handles.text3,'String',str3)
str4=readw("page4.txt",10000);
set(handles.text4,'String',str4)
str5=readw("page5.txt",10000);
set(handles.text5,'String',str5)
str6=readw("page6.txt",10000);
set(handles.text6,'String',str6)
str7=readw("page7.txt",10000);
set(handles.text7,'String',str7)
str8=readw("page8.txt",10000);
set(handles.text8,'String',str8)
str9=readw("page9.txt",10000);
set(handles.text9,'String',str9)
% 读取文本中的内容并显示到text中
% -----------------------------------------------------------------------


% UIWAIT makes tonxin wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tonxin_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% -------------------------------------------------------------------------

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value')==get(hObject,'Max'))
   %被选中了，你想怎么样
   fprintf('选择第一个\n');
   set(handles.uipanel1, 'Visible', 'on');
   set(handles.uipanel2, 'Visible', 'off');
%   set(handles.uipanel,'visible',off);
    
else
    %不被选中，你想怎么样
    fprintf('没点我\n');
end


% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value')==get(hObject,'Max'))
   %被选中了，你想怎么样
   fprintf('选择第2个\n');
   set(handles.uipanel1, 'Visible', 'on');
   set(handles.uipanel2, 'Visible', 'on');
   set(handles.uipanel3, 'Visible', 'off');
    
else
    %不被选中，你想怎么样
    fprintf('没点我\n');
end

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value')==get(hObject,'Max'))
   %被选中了，你想怎么样
   fprintf('选择第3个\n');
   set(handles.uipanel1, 'Visible', 'on');
   set(handles.uipanel2, 'Visible', 'on');
   set(handles.uipanel3, 'Visible', 'on');
   set(handles.uipanel4, 'Visible', 'off');
    
else
    %不被选中，你想怎么样
    fprintf('没点我\n');
end

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value')==get(hObject,'Max'))
   %被选中了，你想怎么样
   fprintf('选择第4个\n');
   set(handles.uipanel1, 'Visible', 'on');
   set(handles.uipanel2, 'Visible', 'on');
   set(handles.uipanel3, 'Visible', 'on');
   set(handles.uipanel4, 'Visible', 'on');
   set(handles.uipanel5, 'Visible', 'off');
    
else
    %不被选中，你想怎么样
    fprintf('没点我\n');
end

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value')==get(hObject,'Max'))
   %被选中了，你想怎么样
   fprintf('选择第5个\n');
   set(handles.uipanel1, 'Visible', 'on');
   set(handles.uipanel2, 'Visible', 'on');
   set(handles.uipanel3, 'Visible', 'on');
   set(handles.uipanel4, 'Visible', 'on');
   set(handles.uipanel5, 'Visible', 'on');
   set(handles.uipanel6, 'Visible', 'off');
    
else
    %不被选中，你想怎么样
    fprintf('没点我\n');
end

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value')==get(hObject,'Max'))
   %被选中了，你想怎么样
   fprintf('选择第6个\n');
   set(handles.uipanel1, 'Visible', 'on');
   set(handles.uipanel2, 'Visible', 'on');
   set(handles.uipanel3, 'Visible', 'on');
   set(handles.uipanel4, 'Visible', 'on');
   set(handles.uipanel5, 'Visible', 'on');
   set(handles.uipanel6, 'Visible', 'on');
   set(handles.uipanel7, 'Visible', 'off');
    
else
    %不被选中，你想怎么样
    fprintf('没点我\n');
end

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value')==get(hObject,'Max'))
   %被选中了，你想怎么样
   fprintf('选择第7个\n');
   set(handles.uipanel1, 'Visible', 'on');
   set(handles.uipanel2, 'Visible', 'on');
   set(handles.uipanel3, 'Visible', 'on');
   set(handles.uipanel4, 'Visible', 'on');
   set(handles.uipanel5, 'Visible', 'on');
   set(handles.uipanel6, 'Visible', 'on');
   set(handles.uipanel7, 'Visible', 'on');
   set(handles.uipanel8, 'Visible', 'off');
    
else
    %不被选中，你想怎么样
    fprintf('没点我\n');
end

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value')==get(hObject,'Max'))
   %被选中了，你想怎么样
   fprintf('选择第8个\n');
   set(handles.uipanel1, 'Visible', 'on');
   set(handles.uipanel2, 'Visible', 'on');
   set(handles.uipanel3, 'Visible', 'on');
   set(handles.uipanel4, 'Visible', 'on');
   set(handles.uipanel5, 'Visible', 'on');
   set(handles.uipanel6, 'Visible', 'on');
   set(handles.uipanel7, 'Visible', 'on');
   set(handles.uipanel8, 'Visible', 'on');
   set(handles.uipanel9, 'Visible', 'off');
    
else
    %不被选中，你想怎么样
    fprintf('没点我\n');
end

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in radiobutton8.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value')==get(hObject,'Max'))
   %被选中了，你想怎么样
   fprintf('选择第9个\n');
   set(handles.uipanel1, 'Visible', 'on');
   set(handles.uipanel2, 'Visible', 'on');
   set(handles.uipanel3, 'Visible', 'on');
   set(handles.uipanel4, 'Visible', 'on');
   set(handles.uipanel5, 'Visible', 'on');
   set(handles.uipanel6, 'Visible', 'on');
   set(handles.uipanel7, 'Visible', 'on');
   set(handles.uipanel8, 'Visible', 'on');
   set(handles.uipanel9, 'Visible', 'on');
    
else
    %不被选中，你想怎么样
    fprintf('没点我\n');
end

% Hint: get(hObject,'Value') returns toggle state of radiobutton8
