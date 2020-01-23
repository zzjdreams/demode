function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 02-Aug-2019 16:31:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% set(handles.figure1,'windowscrollWheelFcn', {@figure1_WindowScrollWheelFcn,gca});

% 设置figure的初始位置
set(handles.figure1,'units','pixels','position',[600,300,580,300]);

%　创建panel并设置其位置
handles.uipanel1=uipanel(handles.figure1,'units','pixels','position',[0,-700, 460, 1400] ,...
    'title','','bordertype','none','backgroundcolor',[1,0.3,0.3]);

% set(handles.text1,'style','text','position',[0,-130, 80, 150], 'tag','text1','string','jj','backgroundcolor',[1,0.3,0.3]);
uicontrol('style','pushbutton','position',[480 20 100 100], 'tag','pushbutton1','string','jj');
set(handles.slider1,'units','pixels','position',[460, 0, 20, 300], 'value',1,'parent',handles.figure1);
% strl=readw("page1.txt",10000);
% set(handles.text1,'String',strl);
% 创建１０个文本文档

% ha=axes('units','pixels','position',[0 0 1 1],'tag','axes1');
% x=0:0.1:2*pi;y=cos(x);
% % axes(handles.axes1);
% plot(x,y);

handles.texts = cell(20,1);
for i=1:20
    handles.texts{i} = uicontrol(handles.uipanel1,'units','pixels','position',...
        [100,1000-50*i, 80,40],'style','text','string',['text ',num2str(i)],'backgroundcolor',...
        [0.3,0.3,0.3],'foregroundcolor',[1,1,1],'fontsize',20);
end

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%　取得滚动条的值
pos = get(hObject,'value');
%　设置panel的位置（左下角点的纵坐标)。
set(handles.uipanel1,'position',[0,-700*pos,460,1200]);
guidata(hObject,handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


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
figure1pos = get(handles.figure1,'position');
panelpos = get(handles.uipanel1,'position');

% 更新panel的位置
panelpos(2) = -(panelpos(4)-figure1pos(4))*movevalue;
set(handles.uipanel1,'position',panelpos);
guidata(hObject,handles);


% --- Executes on key press with focus on slider1 and none of its controls.
function slider1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
