function varargout = ball1figure(varargin)
% BALL1FIGURE MATLAB code for ball1figure.fig
%      BALL1FIGURE, by itself, creates a new BALL1FIGURE or raises the existing
%      singleton*.
%
%      H = BALL1FIGURE returns the handle to a new BALL1FIGURE or the handle to
%      the existing singleton*.
%
%      BALL1FIGURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BALL1FIGURE.M with the given input arguments.
%
%      BALL1FIGURE('Property','Value',...) creates a new BALL1FIGURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ball1figure_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ball1figure_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ball1figure

% Last Modified by GUIDE v2.5 12-Apr-2018 03:12:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ball1figure_OpeningFcn, ...
                   'gui_OutputFcn',  @ball1figure_OutputFcn, ...
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


% --- Executes just before ball1figure is made visible.
function ball1figure_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ball1figure (see VARARGIN)

% Choose default command line output for ball1figure
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ball1figure wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ball1figure_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output=hObject;

i=imread('F:\ALL nEW\Matlab2k17\tennis.jpg');
imshow(i);

[centersBright,radiiBright] = imfindcircles(i,[40 55],'ObjectPolarity','bright', ...
    'Sensitivity',0.92,'Method','twostage','EdgeThreshold',0.1);

img=viscircles(centersBright,radiiBright,'color','b');
n = numel(radiiBright);
set(handles.text3,'string',n);

imshow(img,'Parent',handles.axes3);
